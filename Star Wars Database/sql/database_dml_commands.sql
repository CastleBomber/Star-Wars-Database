# SQL DML commands used by our database
# 5 Views
create view republic as
select people_name, force_value
from WARRIORS join PEOPLE on
warrior.people_id = people.people_id
where faction = 'republic' order by force_value desc;

create view sith as
select people_name, force_value
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
where faction = 'sith' order by force_value desc;


# 12 Queries
Select * from SPECIES
where SPECIES = ‘yodas_race’;

select people_name
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
AND force_value = (
select WARRIORS.People_id from WARRIORS
where max(force_value);

select people_name, planets_name
from PEOPLE join PLANETS on
PEOPLE.people_planet_of_origin = PLANETS.planet_of_origin
ordery by people_name desc;

select people_name,






# 3 Triggers
delimiter //
create trigger good_guy_points_trigger
before insert on warriors
for each row
begin
	if WARRIORS.faction = 'republic' then
		set WARRIORS.force_value  += 100;
	end if;
end; //
delimiter ;

delimiter //
create trigger bad_guy_points_trigger
before insert on warriors
for each row
begin
	if WARRIORS.faction = 'sith' then
		set WARRIORS.force_value  -= 100;
	end if;
end; //
delimiter ;
