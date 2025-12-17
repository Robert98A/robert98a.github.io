############################################################
# 01_packages.R
# Purpose: Install and load required packages
############################################################

packages <- c(
  "tidyverse",
  "janitor",
  "skimr",
  "naniar",
  "lubridate"
)

installed <- rownames(installed.packages())

for (p in packages) {
  if (!p %in% installed) {
    install.packages(p)
  }
}

library(tidyverse)
library(janitor)
library(lubridate)
library(skimr)
library(naniar)
