# 5 Views
-- view 1
create view republic as
select people_name, force_value
from warrior join people on
warrior.people_id = people.people_id
where faction = 'republic' order by force_value desc;

-- view 2
create view sith as
select people_name, force_value
from warrior join people on
warrior.people_id = people.people_id
where faction = 'sith' order by force_value desc;

-- view 3

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

-- view 5
-- which starships are associated with sith vs. republic?

# 12 procedures

-- procedure 1
Select * from species
where species = ‘yodas_race’;

-- procedure 2

-- procedure 3

-- procedure 4

-- procedure 5

-- procedure 5

-- procedure 6

-- procedure 7

-- procedure 8

-- procedure 9

-- procedure 10

-- procedure 11

-- procedure 12

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
