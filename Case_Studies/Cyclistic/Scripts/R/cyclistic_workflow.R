#install necessary packages
install.packages("tidyverse", "janitor")

# load essential packages
library(tidyverse)
library(lubridate)
library(janitor)
library(dplyr)
library(ggplot2)

options(scipen = 999) # changing format for clean results

# setting working directory where data is stored
setwd("/cloud/project/Cyclistic_project/")

#checking the path
getwd()

# list files inside for checking existence
list.files()

# loading each data in separated data frame
q1_2019 <- read_csv("data_raw/Divvy_Trips_2019_Q1.csv") %>% clean_names()
q2_2019 <- read_csv("data_raw/Divvy_Trips_2019_Q2.csv") %>% clean_names()
q3_2019 <- read_csv("data_raw/Divvy_Trips_2019_Q3.csv") %>% clean_names()
q4_2019 <- read_csv("data_raw/Divvy_Trips_2019_Q4.csv") %>% clean_names()
q1_2020 <- read_csv("data_raw/Divvy_Trips_2020_Q1.csv") %>% clean_names()

# checking structure of datasets
str(q1_2019)
str(q2_2019)
str(q3_2019)
str(q4_2019)
str(all_trips)

# checking colnames for matching
colnames(q1_2019)
colnames(q2_2019)
colnames(q3_2019)
colnames(q4_2019)
colnames(q1_2020)
colnames(all_trips)

# renaming colnames for all datasets
# renaming colnames for q1_2019
q1_2019 <- q1_2019 %>%
  rename(
    ride_id = ride_id,
    rideable_type = bikeid,
    started_at = started_at,
    ended_at = ended_at,
    start_station_id = start_station_id,
    start_station_name = start_station_name,
    end_station_id = end_station_id,
    end_station_name = end_station_name,
    member_casual = member_casual
  )

# renaming colnames for q2_2019
q2_2019 <- q2_2019 %>% 
  rename(
    ride_id = x01_rental_details_rental_id,
    rideable_type = x01_rental_details_bike_id,
    started_at = x01_rental_details_local_start_time,
    ended_at = x01_rental_details_local_end_time,
    start_station_name = x03_rental_start_station_name,
    start_station_id = x03_rental_start_station_id,
    end_station_name = x02_rental_end_station_name,
    end_station_id = x02_rental_end_station_id,
    member_casual = user_type
  )

# renaming colnames for q3_2019
q3_2019 <- q3_2019 %>% 
  rename(
    ride_id = trip_id,
    rideable_type = bikeid,
    started_at = start_time,
    ended_at = end_time,
    start_station_name = from_station_name,
    start_station_id = from_station_id,
    end_station_name = to_station_name,
    end_station_id = to_station_id,
    member_casual = usertype
  )

# renaming colnames for q4_2019
q4_2019 <- q4_2019 %>% 
  rename(
    ride_id = trip_id,
    rideable_type = bikeid,
    started_at = start_time,
    ended_at = end_time,
    start_station_name = from_station_name,
    start_station_id = from_station_id,
    end_station_name = to_station_name,
    end_station_id = to_station_id,
    member_casual = usertype
  )

# creating function just for common columns and removing extra column names irrelevant for analysis
common_cols <- Reduce(intersect, list(
  names(q1_2019),
  names(q2_2019),
  names(q3_2019),
  names(q4_2019),
  names(q1_2020)
))

q1_2019  <- q1_2019[common_cols]
q2_2019  <- q2_2019[common_cols]
q3_2019  <- q3_2019[common_cols]
q4_2019  <- q4_2019[common_cols]
q1_2020  <- q1_2020[common_cols]

# Creating a function for standardizing column names order
standard_order <- c(
  "ride_id",
  "rideable_type",
  "started_at",
  "ended_at",
  "start_station_name",
  "start_station_id",
  "end_station_name",
  "end_station_id",
  "member_casual"
)

# Changing column names order for all data frames
q1_2019  <- q1_2019[standard_order]
q2_2019  <- q2_2019[standard_order]
q3_2019  <- q3_2019[standard_order]
q4_2019  <- q4_2019[standard_order]
q1_2020  <- q1_2020[standard_order]

# creating function for changing date/time format to POSIXct for binding data frames
fix_dates <- function(df){
  df %>% 
    mutate(
      started_at = parse_date_time(
        as.character(started_at),
        orders = c("Y-m-d H:M:S", "m/d/Y H:M", "d/m/Y H:M:S")),
      ended_at = parse_date_time(
        as.character(ended_at),
        orders = c("Y-m-d H:M:S", "m/d/Y H:M", "d/m/Y H:M:S"))
    )
}

# apllying all format to every data frame
q1_2019 <- fix_dates(q1_2019)
q2_2019 <- fix_dates(q2_2019)
q3_2019 <- fix_dates(q3_2019)
q4_2019 <- fix_dates(q4_2019)
q1_2020 <- fix_dates(q1_2020)

# changing ride_id and rideable_id format for binding
q1_2019$ride_id <- as.character(q1_2019$ride_id)
q2_2019$ride_id <- as.character(q2_2019$ride_id)
q3_2019$ride_id <- as.character(q3_2019$ride_id)
q4_2019$ride_id <- as.character(q4_2019$ride_id)
q1_2020$ride_id <- as.character(q1_2020$ride_id)

q1_2019$rideable_type <- as.character(q1_2019$rideable_type)
q2_2019$rideable_type <- as.character(q2_2019$rideable_type)
q3_2019$rideable_type <- as.character(q3_2019$rideable_type)
q4_2019$rideable_type <- as.character(q4_2019$rideable_type)
q1_2020$rideable_type <- as.character(q1_2020$rideable_type)

# combining datasets into a single data frame
all_trips <- bind_rows(
  q1_2019,
  q2_2019,
  q3_2019,
  q4_2019,
  q1_2020,
)

# changing member_casual values to match the present ones
all_trips$member_casual <- recode(all_trips$member_casual,
                                  "Subscriber" = "member",
                                  "Customer" = "casual")

# creating a colname to specify ride_length and day_of_week
all_trips <- all_trips %>% 
  mutate(
    started_at = as_datetime(started_at),
    ended_at = as_datetime(ended_at),
    ride_length = as.numeric(ended_at - started_at, units = "mins"),
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE)
  )

# removing bad data and cleaning any missing key values
all_trips <- all_trips %>% 
  filter(ride_length > 0,
         ride_length < 1440,
         !is.na(started_at),
         !is.na(ended_at),
         !is.na(member_casual)
         )

# saving the data already cleaned in folder
write_csv(all_trips, "data_clean/all_trips_cleaned.csv")

# Starting analysis phase

# comparing ride lengths
summary(all_trips$ride_length)

# analyzing mean, median and total number of rides, comparing member to casual
all_trips %>% 
  group_by(member_casual) %>% 
  summarise(
    mean_ride_length = mean(ride_length),
    median_ride_length = median(ride_length),
    number_of_rides = n()
  )

# comparing the moment of week members and casual riders ride
all_trips %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n()) %>% 
  arrange(member_casual, day_of_week)

all_trips %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n()) %>% 
  arrange(desc(number_of_rides))

# creating a data frame for separated rides by day analysis
rides_by_day <- all_trips %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_rides = n(), .groups = "drop")

# creating a plot with side-by-side bars for every rider type to see which of them have more rides
ggplot(rides_by_day, aes(x = day_of_week,
                         y = number_of_rides,
                         fill = member_casual
                         )
       ) +
  geom_col(position = "dodge") +
  labs(
    title = "Number of Rides by Day of Week",
    x = "Day of Week",
    y = "Number of Rides",
    fill = "Rider Type"
  ) +
  theme_minimal()

# creating a summary for average ride length, grouping by member type, and calculate median and mean for each type
avg_ride_length <- all_trips %>% 
  group_by(member_casual) %>% 
  summarise(
    mean_ride_length = mean(ride_length),
    median_ride_length = median(ride_length),
    .groups = "drop"
  )

# creating a plot for mean ride length
ggplot(avg_ride_length, aes(x = member_casual,
                            y = mean_ride_length,
                            fill = member_casual))+
  geom_col()+
  labs(
    title = "Average Ride Length by Rider Type",
    x = "Member type",
    y = "Average ride length(min)",
    fill = "Member type"
  ) +
  theme_minimal()

# verifying seasonal patterns

# creating a month column
all_trips <- all_trips %>% 
  mutate(month = format(started_at, "%b"))

# checking rides per month in a year
rides_by_month <- all_trips %>% 
  group_by(member_casual, month) %>% 
  summarise(
    number_of_rides = n(),
    .groups = "drop"
  )

# setting chronological order of months in the new data frame of rides by month
rides_by_month$month <- factor(
  rides_by_month$month,
  levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
)

# creating a plot of rides by month
ggplot(rides_by_month, aes(x = month,
                           y = number_of_rides,
                           fill = member_casual))+
  geom_col(position = "dodge")+
  labs(
    title = "Number of rides per month",
    x = "Month",
    y = "Number of rides",
    fill = "Rider type"
  )+
  theme_minimal()

# creating hour column for more in depth analysis
all_trips <- all_trips %>% 
  mutate(hour = format(started_at, "%H"))

# checking time of day of each member type to see when they ride more
rides_by_hour <- all_trips %>% 
  group_by(member_casual, hour) %>% 
  summarise(
    number_of_rides = n(),
    .groups = "drop"
  )

# creating a plot for visual checking the rides by hour
ggplot(rides_by_hour, aes(x = hour,
                          y = number_of_rides,
                          color = member_casual,
                          group = member_casual))+
  geom_line(linewidth = 1.2)+
  labs(
    title = "Rides by time of day",
    x = "Hour",
    y = "Number of rides",
    color = "Member type"
  )+
  theme_minimal()

# Checking the distribution of ride lengths to see the difference between casual and member riders more clearly.
ggplot(all_trips, aes(x = member_casual,
                      y = ride_length,
                      fill = member_casual))+
  geom_boxplot()+
  coord_cartesian(ylim = c(0, 60))+ # setting the limit for 1h of readability
  labs(
    title = "Ride length distribution by rider type",
    x = "Rider tipe",
    y = "Ride length(min)"
  )+
  theme_minimal()
  theme(legend.position = "none")
