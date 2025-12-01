-- Checking average ride length
SELECT
  member_casual,
  AVG(ride_length_minutes) AS avg_ride_length
FROM cyclistic-analysis-479022.cyclistic_case_study.merged_tripdata
GROUP BY member_casual;
