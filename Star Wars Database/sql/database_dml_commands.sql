
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
-- Rationale



-- Fifth View

-- Rationale


-- 12 Procedures

-- First Procedure
-- TODO: Stub
select * from species
where species = 'yodas_race';

-- Rationale



-- Second Procedure
-- TODO: Stub
select people.name
from people
join weapon
where people.weapon_name = “lightsaber”

-- Rationale



-- Third Procedure
-- strongest_force?

-- Rationale



-- Fourth Procedure
-- people_home_planets?

-- Rationale



-- Fifth Procedure
-- people_and_battles?

-- Rationale



-- Sixth Procedure
create procedure strongest_force as
begin
select people_name
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
AND force_value = (
    select WARRIORS.People_id from WARRIORS
    where max(force_value));
end;

-- Rationale
-- This query would be used by the DB manager to search up the name of the
--  person who has the strongest force_value in the WARRIORS table.
-

-- view 5
-- which starships are associated with sith vs. republic?

# 12 procedures

-- procedure 1
Select * from species
where species = ‘yodas_race’;

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
order by people_name desc;

select people_name, battles_name
from PEOPLE join WARRIORS on
PEOPLE.people_id = WARRIORS.People_id
join BATTLES on
BATTLES.warriors_id = WARRIORS.warriors_id
order by people_name desc;  

-- procedure 2: Create new person
DELIMETER //

CREATE PROCEDURE CREATEBATTLE()

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

-- Rationale
-- The good_guy_points_trigger offers homage to our heroes of the galaxy. The
--  force will always benefit those who follow the proper teachings. We upgrade
--  force_values to be a part of our game-like simulator in which we can have
--  appropriate entities battling each other.


-- Second Trigger
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

-- Rationale
-- The bad_guy_points_trigger punishes warriors hell bent on conquering the
--  galaxy. As a part of fan fiction, this trigger helps with the storyline of
--  the good side beating the dark side.


-- Third Trigger

-- Rationale
