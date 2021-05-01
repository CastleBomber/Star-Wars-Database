use abc;

select * from product;
select * from customer;
select * from invoice;
select * from line;
select * from payments;
select * from vendor;
select * from castlebomber;

create table CASTLEBOMBER(
	CUS_CODE int,
    foreign key(CUS_CODE) references CUSTOMER(CUS_CODE)
) ENGINE=InnoDB;

insert into CUSTOMER VALUES('1', 'CastleBomber', 'Richie', 'R', '805', '699-6969', NULL, '0', NULL, NULL);
insert into CASTLEBOMBER VALUES('1');

create table PAYMENTS(
	PMT_ID int not null auto_increment,
    PMT_DATE datetime,
    CUS_CODE int,
    PMT_AMT float,
    PMT_TYPE varchar(5),
    PMT_DETAILS varchar(60),
    OWNER varchar(20),
    primary key (PMT_ID),
    foreign key (CUS_CODE) references CUSTOMER(CUS_CODE),
    foreign key (CUS_CODE) references INVOICE(CUS_CODE)
);

# stored procedure sp_cust_purchase that will be used for single customer purchases 
# Based on the business rules above, ensure that all tables are properly updated within a single purchase transaction.
DELIMITER //
create procedure sp_cust_purchase(INV_DATE datetime, CUS_CODE int, INV_TERMS varchar(50), LINE_UNITS float, P_CODE varchar(10), TAX_RATE float)
begin
	declare new_invoice_num int default 0;
    declare unit_price_disc float default 0.00;
    declare unit_price_disc_taxed float default 0.00;
    declare grand_total_purchase float default 0.00;
	start transaction;
    set new_invoice_num = (select (max(invoice.INV_NUMBER)+1) from invoice);
    set unit_price_disc = (select (P_PRICE*(1-P_DISCOUNT)) from product where product.P_CODE = P_CODE);
    set unit_price_disc_taxed = (unit_price_disc*(1+TAX_RATE));
    set grand_total_purchase = (unit_price_disc_taxed*LINE_UNITS);
    
    # credit vs paid
    IF (INV_TERMS IN('30','60','90')) THEN
		insert into invoice values(new_invoice_num, CUS_CODE, INV_DATE, grand_total_purchase, INV_TERMS, 'OPEN');
        update customer set CUS_BALANCE = (CUS_BALANCE + grand_total_purchase) where customer.CUS_CODE = CUS_CODE;
    ELSE
		insert into invoice values(new_invoice_num, CUS_CODE, INV_DATE, grand_total_purchase, INV_TERMS, 'PAID');
        insert into payments(PMT_DATE, CUS_CODE, PMT_AMT, PMT_TYPE, PMT_DETAILS, OWNER) 
        values(INV_DATE, CUS_CODE, grand_total_purchase, INV_TERMS, NULL, 'CASTLEBOMBER');
    END IF;
    
    insert into line values(new_invoice_num, 1, P_CODE, LINE_UNITS, (select P_PRICE from product where product.P_CODE = P_CODE));
    update customer set CUS_DATELSTPUR = INV_DATE where customer.CUS_CODE = CUS_CODE;
    update product set P_QTYOH = (P_QTYOH - LINE_UNITS) where product.P_CODE = P_CODE;
    commit;
end //
DELIMITER ;

drop procedure if exists sp_cust_purchase;

# Run stored procedure
# On March 12th, 2021, a customer with your customer code makes a credit purchase (30 days) 
# of three units of product 11QER/31 with a unit price of $110.00. The tax rate is 10%.
call sp_cust_purchase('2021-03-12', 1, '30', 3, '11QER/31', .1);
select * from invoice;

# Run stored procedure
# On March 17th, 2021, a customer with your customer code makes a cash purchase 
# of three units of product 89-WRE-Q with a unit price of $256.99. The tax rate is 8%. Note discount
call sp_cust_purchase('2021-03-17', 1, 'CASH', 3, '89-WRE-Q', .08);
select * from invoice;
select * from payments;
select * from customer;

# stored procedure sp_cust_payment that will be used for single customer payments
# Follow the above business rules and ensure that all tables and fields are updated according to a single payment transaction.
DELIMITER //
create procedure sp_cust_payment(PMT_DATE datetime, CUS_CODE int, PMT_AMOUNT float, PMT_TYPE varchar(5), PMT_DETAILS varchar(60))
begin
    declare latest_cus_balance float default 0.00;
    declare check_inv_num int default 0;
    declare earliest_open_credit_purchase float default 0.00;
	start transaction;
    insert into payments(PMT_DATE, CUS_CODE, PMT_AMT, PMT_TYPE, PMT_DETAILS, OWNER) values(PMT_DATE, CUS_CODE, PMT_AMOUNT, PMT_TYPE, PMT_DETAILS, 'CASTLEBOMBER');
    update customer set CUS_BALANCE = (CUS_BALANCE - PMT_AMOUNT) where customer.CUS_CODE = CUS_CODE;
    update customer set CUS_DATELSTPMT = PMT_DATE where customer.CUS_CODE = CUS_CODE;
    
    set latest_cus_balance = (select CUS_BALANCE from customer where customer.CUS_CODE = CUS_CODE);
    set check_inv_num = (select min(INV_NUMBER) from invoice where invoice.CUS_CODE = CUS_CODE and INV_STATUS = 'OPEN');
    set earliest_open_credit_purchase = (select INV_TOTAL  from invoice where invoice.INV_NUMBER = check_inv_num);
    
    if (latest_cus_balance <= earliest_open_credit_purchase) then
		update invoice set INV_STATUS = 'PAID' where invoice.INV_NUMBER = check_inv_num;
    end if;
    commit;
end //
DELIMITER ;

drop procedure if exists sp_cust_payment;

# Run stored procedure
# On March 23rd, 2021 a customer with your customer code makes a payment of $100 in cash. 
call sp_cust_payment('2021-03-23', 1, 100, 'CASH', NULL);
select * from payments;
select * from customer;

# Run stored procedure
# On March 24th, 2021 a customer with your customer code makes an 
# additional payment of $200 with check number 10001 from "Database Bank" account number 123456789. 
call sp_cust_payment('2021-03-24', 1, 200, 'CHECK', '"Database Bank" account number 123456789');
select * from payments;

# Run stored procedure
# On March 25th, 2021 a customer with your customer code pays off the remainder 
# of your owed balance with credit card from "CSUCI Bank" numbered 2002-0101-0311-2021 with expiration 05/2021. 
call sp_cust_payment('2021-03-25', 1, 63, 'CC', '"CSUCI Bank" numbered 2002-0101-0311-2021 expr: 05/2021');
