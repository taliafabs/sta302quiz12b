#### Preamble ####
# Purpose: Simulate a survey data set where political preference (Democrat or Republican) 
# depends on age group, gender, income group, and highest level of education
# Author: Talia Fabregas
# Date: 1 April 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Work space setup ####
# install.packages("arrow")
library(tidyverse)
library(janitor)
library(arrow)

#### Simulate data ####
# set seed for reproducibility
set.seed(853)

# set the number of observations to 1000
num_obs <- 10000

age_groups <- c("18-29", 
                "30-44",
                "45-59",
                "60+")

income_groups <- c("0-10,000", 
                   "10,000-40,000",
                   "40,000-60,000",
                   "60,000-80,000",
                   "80,000-100,000",
                   "100,000-150,000",
                   "150,000-200,000",
                   "200,000-250,000",
                   "250,000-300,000",
                   ">300,000")

genders <- c("male", "female", "non binary")

education_levels <- c("No HS",
                             "High school graduate",
                             "Some college",
                             "2-year",
                             "4-year",
                             "Post-grad")

simulated_data <- tibble(
  support_democrat=sample(0:1, size=num_obs, replace=TRUE),
  age_group=sample(age_groups, size=num_obs, replace=TRUE),
  gender=sample(genders, size=num_obs, replace=TRUE),
  income_group=sample(income_groups, size=num_obs, replace=TRUE),
  highest_education=sample(education_levels, size=num_obs, replace=TRUE)
)



#### Save data ####

# save as a parquet under data/simulated_data
write_parquet(simulated_data, 
              "data/simulated_data.parquet")







