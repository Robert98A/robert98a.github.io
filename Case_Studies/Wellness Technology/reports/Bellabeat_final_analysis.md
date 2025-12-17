# Bellabeat smart device usage analysis  
Google Data Analytics case study

## 1. Business task

Analyze smart device usage data to identify behavioral patterns in daily activity, sleep, and sedentary behavior.  
The goal is to support Bellabeat’s marketing team in designing data-driven strategies that increase user engagement and promote healthier habits.

---

## 2. Data source

The analysis uses the **Fitbit Fitness Tracker Data**, a public dataset available on Kaggle.  
The dataset contains daily, hourly, and minute-level activity data from **30 consenting Fitbit users**, including steps, calories, sleep, and heart rate information.

The data was not collected directly by Bellabeat and is used as a proxy to understand general smart device usage behavior among users similar to Bellabeat’s target audience.

Limitations of the data include:
- Small sample size
- Lack of demographic information
- Data collected several years ago

---

## 3. Data cleaning and preparation

Tools used: R (tidyverse, janitor, lubridate, ggplot2).

Main steps:
- Imported multiple CSV files at daily, hourly, and minute levels.
- Standardized all column names to snake_case.
- Converted date and time fields to proper Date and DateTime formats.
- Removed duplicate records to avoid double-counting.
- Filtered out unrealistic values such as zero-calorie days.
- Handled missing values in weight and sleep records.
- Verified consistency of user IDs across datasets.

The resulting cleaned datasets were used for exploration and analysis.

---

## 4. Analysis

### Descriptive findings
- Most users do not reach the recommended 10,000 steps per day.
- Users spend the majority of their time in sedentary or lightly active states.
- Step count shows a strong positive relationship with calories burned.
- Sleep duration commonly falls between 4 and 7 hours per night.
- Activity levels are relatively consistent across the week, with minor data gaps observed.

### Observed patterns
- Sedentary behavior dominates daily routines.
- Step-based metrics are effective indicators of overall activity.
- Sleep and physical activity appear to be weakly correlated.
- Data gaps suggest device non-wear or syncing issues rather than true inactivity.

---

## 5. Key findings

1. Most recorded days fall into sedentary or lightly active categories.  
2. Higher step counts are strongly associated with higher calorie burn.  
3. Many users do not consistently achieve recommended sleep durations.  
4. Sleep duration alone does not predict next-day physical activity.  
5. Data consistency issues may affect user engagement metrics.

---

## 6. Recommendations

1. Introduce sedentary movement alerts that encourage short, achievable activity breaks.  
2. Promote step-based goals in marketing campaigns due to their clear link to calorie burn.  
3. Emphasize sleep tracking and coaching features to address widespread sleep deprivation.  
4. Develop a holistic daily wellness score combining activity and sleep metrics.  
5. Implement device sync reminders to reduce data gaps caused by non-wear or delayed syncing.

These recommendations are directly based on observed user behavior and data patterns.

---

## 7. Tools used

R for data cleaning, transformation, analysis, and visualization.  
tidyverse and lubridate for data manipulation.  
ggplot2 for exploratory visualizations.
