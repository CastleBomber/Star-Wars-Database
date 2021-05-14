# 5 Views
create view republic as
select people_name, force_value
from warrior join people on
warrior.people_id = people.people_id
where faction = 'republic' order by force_value desc;

create view sith as
select people_name, force_value
from warrior join people on
warrior.people_id = people.people_id
where faction = 'sith' order by force_value desc;


# 12 Queries
Select * from species
where species = ‘yodas_race’;


# 3 Triggers
delimiter //
create trigger good_guy_points_trigger
before insert on warriors
for each row
begin
	if warrior.faction = ‘republic’ then
		set warrior.force_value  += 100;
	end if;
end; //
delimiter ;
