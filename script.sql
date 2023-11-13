
-- Exploring Data:
-- Task 1: 
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size;
-- Task 2: 
SELECT 
pg_size_pretty(pg_total_relation_size('sensors.observations_pkey')) as idx_1_size,
pg_size_pretty(pg_total_relation_size('sensors.observations_location_id_datetime_idx')) as idx_2_size;
-- Task 3:
SELECT
pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size,
PG_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;

-- Implementing a large UPDATE and INSERT:
-- Task 4:
UPDATE sensors.observations
SET distance = (distance * 3.281)
WHERE TRUE;

-- Task 5: 
SELECT 
pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size,
pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;

-- Task 6:
VACUUM sensors.observations;
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size;

-- Task 7:
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

-- Task 8:
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;

-- Task 9:
VACUUM FULL sensors.observations;
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;

-- Implementing a large DELETE:
-- Task 10:
DELETE FROM sensors.observations
WHERE location_id > 24;

-- Task 11:
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;

-- Reloading the Table:
-- Task 12:
TRUNCATE sensors.observations;

-- Task 13:
\COPY sensors.observations(id, datetime, location_id, duration, distance, category) FROM './original_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

\COPY sensors.observations(id, datetime, location_id, duration, distance, category) FROM './additional_obs_types.csv' WITH DELIMITER ','         csv HEADER;

-- Task 14:
SELECT 
pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size,
pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;




