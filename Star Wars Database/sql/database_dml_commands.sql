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

create view useTheForce as
select warriors_id, people_name, force_value
from WARRIORS join PEOPLE on
WARRIORS.people_id = PEOPLE.people_id
where force_value > 0
order by force_value desc;

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
