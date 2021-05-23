# SQL DDL used to create our database
create database starwarsdb;
use starwarsdb;

CREATE TABLE PEOPLE(
    people_id int not null primary key auto_increment,
    people_name varchar(60),
    people_height int,
    people_mass int,
    people_hair_color enum('white', 'none', 'auburn', 'brown', 'black', 'grey', 'red', 'n/a', 'blonde', 'unknown', 'blond'),
    people_skin_color enum('brown mottle', 'tan', 'brown', 'fair', 'grey', 'metal', 'silver', 'blue', 'orange', 'pink', 'gold', 'white', 'yellow', 'red', 'gray', 'black', 'pale', 'pale pink', 'green', 'light', 'green-tan', 'dark', 'caucasian', 'mottled green', 'peach', 'n/a', 'hispanic', 'magenta', 'unknown', 'asian', 'purple'),
    people_eye_color enum('brown', 'black', 'grey', 'silver', 'blue', 'green', 'hazel', 'indigo', 'orange', 'pink', 'gold', 'white', 'yellow', 'red', 'n/a', 'blue-gray', 'amber', 'unknown', 'golden'),
    people_birth_year int,
    people_gender varchar(10),
    people_planet_of_origin int,
    people_films set('1', '2', '3', '4', '5', '6',’7’),
    people_weapon_id int,
    people_vehicles_id int,
    people_species_id int,
    people_starships_id int,
    foreign key (people_planet_of_origin) references PLANETS(planet_id),
    foreign key(people_weapon_id) references WEAPONS(weapon_id),
    foreign key(people_vehicles_id) references VEHICLES(vehicles_id),
    foreign key(people_species_id) references SPECIES(species_id),
    foreign key(people_planets_of_origin_id) references PLANETS(planets_id),
    foreign key(people_starshps_id) references STARSHIPS(starships_id)
);


create table if not exists STARSHIPS(
starships_id int not null primary key auto_increment,
starships_name varchar(60),
starships_model varchar(90),
starships_manufacturer varchar (150),
starships_cost_in_credits bigint,
starships_length int,
starships_max_atmosphering_speed int,
starships_min_crew int,
starships_max_crew int,
starships_passengers int,
starships_cargo_capacity bigint,
starships_consumables int,
starships_hyperdrive_rating decimal(4,2),
starships_MGLT int,
starships_starship_class varchar(50)
);

create table if not exists WEAPONS(
weapons_id int not null primary key auto_increment,
weapons_name varchar(50),
weapons_color varchar(20)
);

create table if not exists EVENTS(
events_id int not null primary key auto_increment,
events_name varchar(70),
events_film smallint,
events_winner varchar(20),
events_films_id int,
foreign key(events_films_id) references FILMS(films_id)
);

create table if not exists EVENTS_WEAPONS(
events_id int not null primary key,
weapons_id int,
description varchar(100),
foreign key(events_films_id) references FILMS(films_id)
);

CREATE TABLE VEHICLES(
    vehicles_id int not null primary key auto_increment,
    vehicles_name varchar(60),
    vehicles_model varchar(60),
    vehicles_manufacturer varchar(60),
    vehicles_cost_in_credits bigint,
    vehicles_length decimal(7,2),
    vehicles_max_atmosphering_speed int,
    vehicles_crew int,
    vehicles_passengers int,
    vehicles_cargo_capacity int,
    vehicles_consumables varchar(40),
    vehicles_vehicle_class varchar(40),
    vehicles_films set('1', '2', '3', '4', '5', '6', '7')
);


CREATE TABLE FILMS(
    films_id int not null primary key auto_increment,
    films_title varchar(60),
    films_episode_id int,
    films_opening_crawl varchar(800),
    films_director varchar(60),
    films_producer varchar(200),
    films_release_date date
);

create table PLANETS
(
planets_id int not null primary key auto_increment,
planets_name char(50),
planets_rotation_period int,
planets_orbital_period int,
planets_diameter int,
planets_climate enum('moist', 'unknown', 'murky', 'superheated', 'subartic', 'artic', 'arid', 'polluted', 'rocky', 'tropical', 'humid', 'frozen', 'windy', 'temperate', 'frigid', 'hot', 'artificial temperate '),
planets_gravity varchar(20),
planets_terrain set('verdant', 'unknown', 'swamps', 'grass', 'swamp', 'deserts', 'rock arches', 'rainforests', 'lakes', 'rocky', 'vines', 'grasslands', 'acid pools', 'plains', 'gas giant', 'seas', 'fungus forests', 'hills', 'mesas', 'ice canyons', 'jungles', 'savanna', 'barren', 'airless asteroid', 'volcanoes', 'glaciers', 'islands', 'ice caves', 'forests', 'cities', 'grassy hills', 'canyons', 'scrublands', 'reefs', 'mountains', 'sinkholes', 'mountain ranges', 'urban', 'oceans', 'cityscape', 'lava rivers', 'cliffs', 'rocky canyons', 'rock', 'plateaus', 'bogs', 'ocean', 'valleys', 'tundra', 'rivers', 'rocky islands', 'jungle', 'toxic cloudsea', 'ash', 'savannahs', 'mountain', 'fields', 'rocky deserts', 'savannas', 'desert', 'caves'),
planets_surface_water int,
planets_population bigint,
planets_films set('1', '2', '3', '4', '5', '6', '7')
);

create table SPECIES(
species_id int not null primary key auto_increment,
species_name char(50),
species_classification char(50),
species_designation char(50),
species_average_height int,
species_skin_colors set('n/a', 'brown', 'pale', 'peach', 'white', 'pink', 'tan', 'hispanic', 'yellow', 'blue', 'magenta', 'caucasian', 'red', 'green', 'black', 'gray', 'dark', 'asian', 'grey', 'orange', 'pale pink', 'purple'),
species_hair_colors set('n/a', 'unknown', 'red', 'brown', 'none', 'white', 'black', 'blond', 'blonde'),
species_eye_colors set('n/a', 'unknown', 'brown', 'red', 'indigo', 'grey', 'green', 'golden', 'yellow', 'black', 'orange', 'pink', 'blue', 'hazel', 'amber', 'silver'),
species_average_lifespan int,
species_planet_of_origin int foreign key,
species_language char(50),
species_films set('1', '2', '3', '4', '5', '6', '7')
);


create table if not exists BATTLES (
battle_id int not null auto_increment primary key,
weapon_id int,
Apprentice_id int,
Status varchar(20),
Force_value int,
Foreign key (weapon_id) references weapon (weapon_id),
Foreign key Apprentice_id references people (people_id)
);

create table WARRIORS (
	Warrior_id int not null primary key auto_increment,
	People_id int ,
	Weapon_id int,
	Apprentice_id int,
	Status varchar(50),
	Force_value int,
	Foreign key(people_id) references people(people_id),
	Foreign key(weapon_id) references weapon(weapon_id),
	Foreign key(apprentice_id) references people(people_id)
);


create table BOOKS(
books_id int not null primary key auto_increment,
book_title varchar(100),
authors_id int,
publishers_id int
);

create table AUTHORS(
authors_id int not null primary key auto_increment,
authors_firstname varchar(70),
authors_lastname varchar(70)
);

create table PUBLISHERS(
publishers_id int not null primary key auto_increment,
publishers_name varchar(100),
publishers_country varchar(100)
);

create table ACTORS(
actors_id int not null primary key auto_increment,
actors_firstname varchar(100),
actors_lastname varchar(100)
);

create table ROLES(
films_id int,
actors_id int
);
