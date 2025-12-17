############################################################
# 04_analysis_summary.R
# Purpose: Summaries and analytical variables
############################################################

# User counts
n_users_daily  <- n_distinct(daily_activity$id)
n_users_sleep  <- n_distinct(minute_sleep$id)
n_users_weight <- n_distinct(weight_log$id)
n_users_hr     <- n_distinct(heartrate_seconds$id)

# Daily summary
daily_summary <- daily_activity %>% 
  summarise(
    users = n_distinct(id),
    avg_steps = mean(total_steps),
    median_steps = median(total_steps),
    avg_active_minutes = mean(very_active_minutes),
    avg_sedentary = mean(sedentary_minutes),
    avg_calories = mean(calories)
  )

# Weekday variable
daily_activity <- daily_activity %>% 
  mutate(weekday = wday(activity_date, label = TRUE))

# Activity level
daily_activity <- daily_activity %>% 
  mutate(
    activity_level = case_when(
      total_steps < 5000 ~ "Low",
      total_steps < 10000 ~ "Moderate",
      TRUE ~ "High"
    )
  )
