-- Checking number of rides by rider type
SELECT
  member_casual,
  COUNT(*) AS total_rides
FROM cyclistic-analysis-479022.cyclistic_case_study.merged_tripdata
GROUP BY member_casual;
