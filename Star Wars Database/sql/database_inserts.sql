# SQL inserts necessary to recreate our database. Or appropriate CSV files and an import script.

select * from user_account;

insert into user_account(firstname, lastname, username, password) values('Richie','CastleBomber','CastleBomber','$star420Wars!');
insert into user_account(firstname, lastname, username, password) values('Maddie','Sullivan','Elephant454','$star420Wars!');
insert into user_account(firstname, lastname, username, password) values('Ilan','Harari','ilanharari','$star420Wars!');
insert into user_account(firstname, lastname, username, password) values('Darth','Vader','DarthVader','password');
insert into user_account(firstname, lastname, username, password) values('Darth','Maul','DarthMaul','password');

select * from PLANETS;

insert into PLANETS(planets_name, planets_rotation_period, planets_orbital_period, planets_diameter, planets_climate, planets_gravity, planets_terrain, planets_surface_water, planets_population, planets_films)
values ('Tatooine', '23', '304', '10465', 'arid', '1', 'desert', '1', '200000', 1);
insert into PLANETS(planets_name, planets_rotation_period, planets_orbital_period, planets_diameter, planets_climate, planets_gravity, planets_terrain, planets_surface_water, planets_population, planets_films)
values ('Alderaan', '24', '364', '12500', 'temperate', '1', 'grasslands', '40', '2000000000', NULL);

select * from PEOPLE;

insert into PEOPLE(people_name, people_height, people_mass, people_hair_color, people_skin_color, people_eye_color, people_birth_year, people_gender, people_planet_of_origin, people_films, people_weapon_id, people_vehicles_id, people_species_id, people_starships_id)
value('Luke Skywalker','172','77','blond','fair','blue','19','male',null,null,null,null,null,null);
insert into PEOPLE(people_name, people_height, people_mass, people_hair_color, people_skin_color, people_eye_color, people_birth_year, people_gender, people_planet_of_origin, people_films, people_weapon_id, people_vehicles_id, people_species_id, people_starships_id)
value('C-3PO','167','75',null,'gold','yellow','112',null,null,null,null,null,null,null);
