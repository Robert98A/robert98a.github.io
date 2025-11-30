CREATE OR REPLACE TABLE cyclistic-analysis-479022.cyclistic_case_study.merged_tripdata AS
SELECT * FROM cyclistic-analysis-479022.cyclistic_case_study.clean_2019_Q1
UNION ALL
SELECT * FROM cyclistic-analysis-479022.cyclistic_case_study.clean_2019_Q2
UNION ALL
SELECT * FROM cyclistic-analysis-479022.cyclistic_case_study.clean_2019_Q3
UNION ALL
SELECT * FROM cyclistic-analysis-479022.cyclistic_case_study.clean_2019_Q4
UNION ALL
SELECT * FROM cyclistic-analysis-479022.cyclistic_case_study.clean_2020_Q1;
