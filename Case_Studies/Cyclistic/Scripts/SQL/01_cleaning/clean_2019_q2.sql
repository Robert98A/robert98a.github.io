-- STEP 1: Build the cleaned table with correct column names
CREATE OR REPLACE TABLE `cyclistic-analysis-479022`.cyclistic_case_study.clean_2019_Q2 AS

SELECT
  -- Change name and type of the raw Q2 columns to match 2020 schema
  CAST(`01 - Rental Details Rental ID` AS STRING) AS ride_id,
  CAST(`01 - Rental Details Bike ID` AS STRING) AS rideable_type,
  `01 - Rental Details Local Start Time` AS started_at,
  `01 - Rental Details Local End Time` AS ended_at,
  `03 - Rental Start Station Name` AS start_station_name,
  CAST(`03 - Rental Start Station ID` AS STRING) AS start_station_id,
  CAST(`02 - Rental End Station ID` AS STRING) AS end_station_id,
  `02 - Rental End Station Name` AS end_station_name,

  -- Making coordonates NULL because not in use
  NULL AS start_lat,
  NULL AS start_lng,
  NULL AS end_lat,
  NULL AS end_lng,

  -- Changing member type to new ones and renaming member type column name
  CASE
    WHEN `User Type` = 'Subscriber' THEN 'member'
    WHEN `User Type` = 'Customer' THEN 'casual'
  END AS member_casual,

  -- Ride length in minutes from raw duration
  CAST(`01 - Rental Details Duration In Seconds Uncapped` AS FLOAT64) / 60.0 AS ride_length_minutes,

  -- Day of week
  FORMAT_TIMESTAMP('%A', `01 - Rental Details Local Start Time`) AS day_of_week

FROM `cyclistic-analysis-479022`.cyclistic_case_study.raw_2019_Q2
WHERE
  -- Keep only valid rides and removing blanks, too long rides, too short rides or negative.
  (CAST(`01 - Rental Details Duration In Seconds Uncapped` AS FLOAT64)/60.0) > 1
  AND (CAST(`01 - Rental Details Duration In Seconds Uncapped` AS FLOAT64)/60.0) < 1440
  AND `01 - Rental Details Local Start Time` IS NOT NULL
  AND `01 - Rental Details Local End Time` IS NOT NULL
  AND `03 - Rental Start Station Name` IS NOT NULL
  AND `02 - Rental End Station Name` IS NOT NULL;
