-- Checking time of day patterns
SELECT
  member_casual,
  EXTRACT(HOUR FROM started_at) AS hour,
  COUNT(*) AS rides
FROM cyclistic-analysis-479022.cyclistic_case_study.merged_tripdata
GROUP BY member_casual, hour
ORDER BY member_casual, hour;
