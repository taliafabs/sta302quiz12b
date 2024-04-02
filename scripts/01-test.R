#### Preamble ####
# Purpose: Test the simulated data
# Author: Talia Fabregas
# Date: 29 March 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - run 00-simulate_data.R first


#### Work space setup ####
library(tidyverse)
library(testthat)
library(arrow)

# read in the simulated data
data <- read_parquet("data/simulated_data.parquet")

#### Test data ####

# Test that the vote_biden is equal to 1 or 0 for every observation
# 1 if democrat 0 if republican
if(all(data$support_democrat == 1 |data$support_democrat==0)){
  "The survey support_democrat binary values are all 1 or 0"
} else{
  "At least one of the support_democrat values in the survey data is not 1 or 0"
}

# Test that every age group falls in the expected age groups
age_groups <- c("18-29", 
                "30-44",
                "45-59",
                "60+")

if(all(unique(data$age_group) %in% age_groups)){
  "The simulated data age groups match the expected age groups"
} else{
  "Not all of the age groups match the expected age groups"
}


# Test that every gender is male, female, or non binary
genders <- c("male", "female", "non binary")

if(all(unique(data$gender) %in% genders)){
  "The simulated data genders match the expected genders"
} else{
  "Not all of the genders match the expected genders"
}

# Test that the income groups are what we expect
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

if(all(unique(data$income_group) %in% income_groups)){
  "The simulated data income groups all match the expected income groups"
} else{
  "Not all of the income groups match the expected income groups groups"
}

# Test that the values of education_level are what we expect

education_levels <- c("No HS",
                      "High school graduate",
                      "Some college",
                      "2-year",
                      "4-year",
                      "Post-grad")

if(all(unique(data$income_group) %in% income_groups)){
  "The simulated data  education levels all match the expected education levels"
} else{
  "Not all of the education levels match the expected education levels"
}



