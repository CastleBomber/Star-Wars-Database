
-- 5 Views

-- First View

# SQL DML commands used by our database
# 5 Views
-- view 1

create view republic as
select people_name, force_value
from WARRIORS join PEOPLE on
warrior.people_id = people.people_id
where faction = 'republic' order by force_value desc;

-- Rationale
-- Creating a view for Republic is essential for the database as it is one of
--  the most desired views for fans using the database. The Republic versus the
--  Sith is what makes the story of Star Wars. We are able to capture this view
--  easily with joins from our Warriors and PEOPLE entities, searching out for
--  the factions attribute.


-- Second View

-- view 2

create view sith as
select people_name, force_value
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
where faction = 'sith' order by force_value desc;

-- Rationale
-- Continuing on the rationale of our making or Republic, the Sith view is the
--  perfect addition to compare attributes amongst both views.


-- Third View
create view useTheForce as
select warriors_id, people_name, force_value
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
where force_value > 0
order by force_value desc;

-- Rationale
-- We decided to make a useTheForce view as it allows for easy access to show
--  which warriors have force values. The view also showcases who has the top
--  force value.


-- Fourth View
- view 3


-- which warriors from a certain planet?

create view warrior_planet as
select people_name, planets_name
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
join PLANETS on
PEOPLE.people_id = PEOPLE.people_planet_of_origin
group by planets_name;

-- which vehicles are associated with sith vs. republic in what battles?
create view vehicle_alliance as
select vehicle_name, faction, battles_name from
VEHICLES JOIN PEOPLE ON
vehicles_id = people_vehicles_id
join WARRIORS ON
PEOPLE.people_id = WARRIORS.people_id
join BATTLES on
WARRIORS_ID = warriors_id
group by BATTLES_ID;

-- view 4
-- compare force value with lightsaber color

create view weapon_power as
select people_name, force_value, weapons_name
from PEOPLE join WEAPONS on
PEOPLE.people_weapon_id = WEAPONS.weapons_id
join WARRIORS on
PEOPLE.people_id = WARRIORS.people_id
order by force_value ASC;

create view warrior_planet as
select people_name, planets_name
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
join PLANETS on
PEOPLE.people_id = PEOPLE.people_planet_of_origin
group by planets_name;

-- which vehicles are associated with sith vs. republic in what battles?
create view vehicle_alliance as
select vehicle_name, faction, battles_name from
VEHICLES JOIN PEOPLE ON
vehicles_id = people_vehicles_id
join WARRIORS ON
PEOPLE.people_id = WARRIORS.people_id
join BATTLES on
WARRIORS_ID = warriors_id
group by BATTLES_ID;

-- view 4
-- compare force value with lightsaber color

create view weapon_power as
select people_name, force_value, weapons_name
from PEOPLE join WEAPONS on
PEOPLE.people_weapon_id = WEAPONS.weapons_id
join WARRIORS on
PEOPLE.people_id = WARRIORS.people_id
order by force_value ASC;


-- 12 Procedures Queries
-- -----------------------------------------

Select * from SPECIES
where SPECIES = ‘yodas_race’;

create procedure strongest_force as
begin
select people_name
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
AND force_value = (
select WARRIORS.People_id from WARRIORS
where max(force_value);
end;


create procedure people_home_planets as
begin
select people_name, planets_name
from PEOPLE join PLANETS on
PEOPLE.people_planet_of_origin = PLANETS.planet_of_origin
order by people_name desc;
END;


create procedure people_and_battles as
begin
select people_name, battles_name
from PEOPLE join WARRIORS on
PEOPLE.people_id = WARRIORS.People_id
join BATTLES on
BATTLES.warriors_id = WARRIORS.warriors_id
order by people_name desc;
end;

create procedure show_books as
begin
select * from BOOKS;
end;

create procedure show_planets as
begin
select * from PLANETS;
end;

create procedure show_events as
begin
select * from EVENTS;
end;

create procedure show_vehicles as
begin
select * from VEHICLES;
end;

create procedure show_weapons as
begin
select * from WEAPONS;
end;

create procedure show_weapons_colors as
begin
select weapon_color from WEAPONS;
end;

create procedure show_starships as
begin
select * from STARSHIPS;
end;

create procedure show_battles as
begin
select * from BATTLES;
end;

-- procedure 3: Initiate battle between two warriors

-- procedure 4:

-- procedure 5

-- procedure 5

-- procedure 6

-- procedure 7

-- procedure 8

-- procedure 9

-- procedure 10

-- procedure 11

-- procedure 12

-- Seventh Procedure
create procedure people_home_planets as
begin
select people_name, planets_name
from PEOPLE join PLANETS on
PEOPLE.people_planet_of_origin = PLANETS.planet_of_origin
order by people_name desc;
END;

-- Rationale
-- This query would be used by the DB manager to search up the name of the
--  person who has the strongest force_value in the WARRIORS table.


-- Eighth Procedure
create procedure people_and_battles as
begin
select people_name, battles_name
from PEOPLE join WARRIORS on
PEOPLE.people_id = WARRIORS.People_id
join BATTLES on
BATTLES.warriors_id = WARRIORS.warriors_id
order by people_name desc;
end;

-- Rationale
-- This query would be used by the DB manager to search up the warriors and all
--  the battles that are cataloged within the database.


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


delimiter //
create trigger books_trigger
before insert on warriors
for each row
begin
	int cool;
	if BOOKS.books_id = 1 then
		set cool = 1;
	end if;
end; //
delimiter ;
