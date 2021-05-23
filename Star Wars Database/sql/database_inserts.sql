# SQL inserts necessary to recreate our database.
# Or appropriate CSV files and an import script.
START TRANSACTION;
INSERT INTO LGBRAND VALUES (23, 'FORESTERS BEST', 'VALUE');
INSERT INTO LGBRAND VALUES (33, 'BINDER PRIME', 'PREMIUM');
COMMIT;



insert into PLANETS values ('Tatooine', 23, 304, 10465, arid, '1', desert, 1, 200000, NULL);


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
