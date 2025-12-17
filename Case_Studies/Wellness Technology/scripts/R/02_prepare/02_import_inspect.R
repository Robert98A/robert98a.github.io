############################################################
# 02_import_inspect.R
# Purpose: Import cleaned data and inspect structure
############################################################

# Set data path (relative path for GitHub)
data_path <- "data/cleaned"

# Import datasets
daily_activity <- read_csv(file.path(data_path, "daily_activity.csv"))
minute_sleep   <- read_csv(file.path(data_path, "minute_sleep.csv"))
weight_log     <- read_csv(file.path(data_path, "weight_log.csv"))

hourly_calories    <- read_csv(file.path(data_path, "hourly_calories.csv"))
hourly_intensities <- read_csv(file.path(data_path, "hourly_intensities.csv"))
hourly_steps       <- read_csv(file.path(data_path, "hourly_steps.csv"))

minute_calories    <- read_csv(file.path(data_path, "minute_calories_narrow.csv"))
minute_intensities <- read_csv(file.path(data_path, "minute_intensities_narrow.csv"))
minute_mets        <- read_csv(file.path(data_path, "minute_mets_narrow.csv"))
minute_steps       <- read_csv(file.path(data_path, "minute_steps_narrow.csv"))

heartrate_seconds  <- read_csv(file.path(data_path, "heartrate_seconds.csv"))

# Initial inspection
glimpse(daily_activity)
glimpse(minute_sleep)
glimpse(weight_log)
glimpse(hourly_steps)
glimpse(minute_steps)
glimpse(heartrate_seconds)
