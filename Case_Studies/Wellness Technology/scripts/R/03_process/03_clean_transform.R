############################################################
# 03_clean_transform.R
# Purpose: Clean, transform, and prepare data for analysis
############################################################

# ----------------------------
# Date / time conversion
# ----------------------------

daily_activity <- daily_activity %>%
  mutate(activity_date = mdy(activity_date))

minute_sleep <- minute_sleep %>%
  mutate(date = mdy_hms(date))

weight_log <- weight_log %>%
  mutate(date = mdy_hms(date))

hourly_steps        <- hourly_steps %>% mutate(activity_hour = mdy_hms(activity_hour))
hourly_calories     <- hourly_calories %>% mutate(activity_hour = mdy_hms(activity_hour))
hourly_intensities  <- hourly_intensities %>% mutate(activity_hour = mdy_hms(activity_hour))

minute_steps        <- minute_steps %>% mutate(activity_minute = mdy_hms(activity_minute))
minute_calories     <- minute_calories %>% mutate(activity_minute = mdy_hms(activity_minute))
minute_intensities  <- minute_intensities %>% mutate(activity_minute = mdy_hms(activity_minute))
minute_mets         <- minute_mets %>% mutate(activity_minute = mdy_hms(activity_minute))

heartrate_seconds <- heartrate_seconds %>%
  mutate(
    time = str_replace_all(time, '"', ''),
    time = str_trim(time),
    time = parse_datetime(time, "%m/%d/%Y %I:%M:%S %p")
  )

# ----------------------------
# Clean column names
# ----------------------------

daily_activity      <- clean_names(daily_activity)
minute_sleep        <- clean_names(minute_sleep)
weight_log          <- clean_names(weight_log)
hourly_steps        <- clean_names(hourly_steps)
hourly_calories     <- clean_names(hourly_calories)
hourly_intensities  <- clean_names(hourly_intensities)
minute_steps        <- clean_names(minute_steps)
minute_calories     <- clean_names(minute_calories)
minute_intensities  <- clean_names(minute_intensities)
minute_mets         <- clean_names(minute_mets)
heartrate_seconds   <- clean_names(heartrate_seconds)

# ----------------------------
# Remove duplicates
# ----------------------------
minute_sleep <- minute_sleep %>% distinct()

# ----------------------------
# Handle missing values
# ----------------------------
weight_log <- weight_log %>% filter(!is.na(fat))

# ----------------------------
# Remove unrealistic values
# ----------------------------
daily_activity <- daily_activity %>%
  filter(calories > 0) %>%
  filter(!(total_steps == 0 & very_active_minutes > 0))
