############################################################
# 05_visualizations.R
# Purpose: Visual exploration of trends
############################################################

# Distribution of daily steps
ggplot(daily_activity, aes(total_steps)) +
  geom_histogram(binwidth = 2000) +
  labs(
    title = "Distribution of Daily Steps",
    x = "Total Steps",
    y = "Number of Days"
  )

# Steps vs calories
ggplot(daily_activity, aes(total_steps, calories)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm") +
  labs(
    title = "Daily Steps vs Calories",
    x = "Total Steps",
    y = "Calories"
  )

# Average steps by weekday
steps_by_weekday <- daily_activity %>% 
  group_by(weekday) %>% 
  summarise(avg_steps = mean(total_steps), .groups = "drop")

ggplot(steps_by_weekday, aes(weekday, avg_steps, group = 1)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Average Daily Steps by Weekday",
    x = "Weekday",
    y = "Average Steps"
  )

# Heart rate distribution
ggplot(heartrate_seconds, aes(value)) +
  geom_histogram(binwidth = 5) +
  labs(
    title = "Heart Rate Distribution",
    x = "Heart Rate (bpm)",
    y = "Count"
  )
