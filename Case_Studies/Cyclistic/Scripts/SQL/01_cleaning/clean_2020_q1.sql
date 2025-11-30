CREATE OR REPLACE TABLE `cyclistic-analysis-479022`.cyclistic_case_study.clean_2020_Q1 AS -- Create a clean table
SELECT
-- Changing data types to standard ones
  CAST(ride_id AS STRING) AS ride_id,
  CAST(rideable_type AS STRING) AS rideable_type,
  CAST(started_at AS TIMESTAMP) AS started_at,
  CAST(ended_at AS TIMESTAMP) AS ended_at,
  CAST(start_station_name AS STRING) AS start_station_name,
  CAST(start_station_id AS STRING) AS start_station_id,
  CAST(end_station_name AS STRING) AS end_station_name,
  CAST(end_station_id AS STRING) AS end_station_id,
  CAST(start_lat AS FLOAT64) AS start_lat,
  CAST(start_lng AS FLOAT64) AS start_lng,
  CAST(end_lat AS FLOAT64) AS end_lat,
  CAST(end_lng AS FLOAT64) AS end_lng,
  CAST(member_casual AS STRING) AS member_casual,
  CAST(ride_length_minutes AS FLOAT64) AS ride_length_minutes,
  CAST(day_of_week AS STRING) AS day_of_week

-- Telling SQL where the data is from and what to change before taking it for the clean table
FROM
  (
    SELECT
      -- Changing column names and data types for columns in need
      ride_id AS ride_id,
      CAST(rideable_type AS STRING) AS rideable_type,
      CAST(start_station_name AS STRING) AS start_station_name,
      CAST(end_station_name AS STRING) AS end_station_name,
      CAST(start_station_id AS STRING) AS start_station_id,
      CAST(end_station_id AS STRING) AS end_station_id,
      started_at AS started_at,
      ended_at AS ended_at,

      -- Setting missing coordonates to NULL because of not in use
      NULL AS start_lat,
      NULL AS start_lng,
      NULL AS end_lat,
      NULL AS end_lng,

      -- Changing member types to new ones to match 2020 ones
      CASE
        WHEN member_casual = 'Subscriber' THEN 'member'
        WHEN member_casual = 'Customer' THEN 'casual'
      END AS member_casual,

      -- Creating a column in cleaned table for ride length converted in minutes
      TIMESTAMP_DIFF(ended_at, started_at, SECOND) / 60.0 AS ride_length_minutes,

      -- Creating a column in cleaned table for day of week
      FORMAT_TIMESTAMP('%A', started_at) AS day_of_week
    FROM
      `cyclistic-analysis-479022`.cyclistic_case_study.raw_2020_Q1
  )
WHERE
  -- Removing blanks, negative, short or too long rides and keeping the good ones
  ride_length_minutes > 1
  AND ride_length_minutes < 1440
  AND started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL;
