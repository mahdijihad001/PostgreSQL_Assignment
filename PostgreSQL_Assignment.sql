-- Active: 1747497213189@@127.0.0.1@5000@new_test_db


-- =========CREATE TABLES===========
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
);


CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(150) NOT NULL,
    notes VARCHAR(250)
);

-- =======INSERT DATA==========
INSERT INTO rangers(name, region)
    VALUES ('Alice Green', 'Northern Hills'),
            ('Bob White', 'River Delta'),
            ('Carol King', 'Mountain Range'),
            ('David Brown', 'Coastal Plains'),
            ('Emily Young', 'Forest Canopy'),
            ('Frank Miller', 'Southern Plateau'),
            ('Grace Harris', 'Lake District'),
            ('Henry Taylor', 'Savanna Grasslands'),
            ('Isabella Clark', 'Desert Oasis'),
            ('Jack Wilson', 'Tropical Rainforest');


INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
    ('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
    ('Great Indian Bustard', 'Ardeotis nigriceps', '1863-01-01', 'Critically Endangered'),
    ('Ganges River Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
    ('Indian Pangolin', 'Manis crassicaudata', '1825-01-01', 'Near Threatened'),
    ('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
    ('Indian Star Tortoise', 'Geochelone elegans', '1831-01-01', 'Vulnerable');

INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes)
    VALUES 
        (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
        (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
        (2, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
        (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', 'Camera trap image captured');




--  Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers(name , region) VALUES ('Derek Fox' , 'Coastal Plains');



--  Count unique species ever sighted.

SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;


--  Find all sightings where the location includes "Pass".

SELECT * FROM sightings WHERE location ILIKE '%Pass%';

-- List each ranger's name and their total number of sightings.

SELECT r.name, COUNT(s.sighting_id) AS total_sightings FROM rangers r LEFT JOIN sightings s ON r.ranger_id = s.ranger_id GROUP BY r.name ORDER BY r.name;


-- List species that have never been sighted.
SELECT sp.common_name FROM species sp LEFT JOIN sightings s ON sp.species_id = s.species_id WHERE s.species_id IS NULL;

-- Show the most recent 2 sightings.

SELECT sp.common_name, s.sighting_time, r.name 
FROM sightings s JOIN species sp ON s.species_id = sp.species_id JOIN rangers r ON s.ranger_id = r.ranger_id
 ORDER BY s.sighting_time DESC LIMIT 2;

--  Update all species discovered before year 1800 to have status 'Historic'.

UPDATE species SET conservation_status = 'Historic' WHERE discovery_date < '1800-01-01';

-- Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

SELECT  sighting_id, CASE 
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) <= 17 THEN 'Afternoon' ELSE 'Evening' END AS time_of_day FROM sightings;



-- Delete rangers who have never sighted any species

DELETE FROM rangers WHERE ranger_id NOT IN ( SELECT DISTINCT ranger_id FROM sightings );





SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;



