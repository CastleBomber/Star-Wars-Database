-- 5 Views

-- First View
create view republic as
select people_name, force_value
from warrior join people on
warrior.people_id = people.people_id
where faction = 'republic' order by force_value desc;

-- Rationale



-- Second View
create view sith as
select people_name, force_value
from warrior join people on
warrior.people_id = people.people_id
where faction = 'sith' order by force_value desc;

-- Rationale



-- Third View

-- Rationale



-- Fourth View

-- Rationale



-- Fifth View

-- Rationale





-- 12 Procedures

-- First Procedure
Select * from species
where species = 'yodas_race';

-- Rationale



-- Second Procedure

-- Rationale



-- Third Procedure

-- Rationale



-- Fourth Procedure

-- Rationale



-- Fifth Procedure

-- Rationale



-- Sixth Procedure

-- Rationale



-- Seventh Procedure

-- Rationale



-- Eighth Procedure

-- Rationale



-- Ninth Procedure

-- Rationale



-- Tenth Procedure

-- Rationale



-- Eleventh Procedure

-- Rationale



-- Twelfth Procedure

-- Rationale





-- 3 Triggers

-- First Trigger
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

-- Rationale



-- Second Trigger

-- Rationale



-- Third Trigger

-- Rationale
