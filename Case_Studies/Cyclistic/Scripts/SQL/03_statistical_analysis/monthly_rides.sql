-- Checking monthly ride trends
SELECT
  member_casual,
  EXTRACT(YEAR FROM started_at) AS year,
  EXTRACT(MONTH FROM started_at) AS month,
  COUNT(*) AS rides
FROM cyclistic-analysis-479022.cyclistic_case_study.merged_tripdata
GROUP BY member_casual, year, month
ORDER BY year, month, member_casual;
