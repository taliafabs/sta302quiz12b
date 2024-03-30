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
data <- read_parquet("data/simulated_cancer_data.parquet")

#### Test data ####

# Test that the patient_died variable is equal to 1 (patient died) or 0 (patient lived)
if(all(data$patient_died == 1 |data$patient_died==0)){
  "The simulated patient_died binary values are all 1 or 0"
} else{
  "At least one of the patient_died values in the survey data is not 1 or 0"
}

# Test that every observation in the simulated data is age 0 to 99
if(all(data$age >= 0)){
  "All individuals in the simulated data have a non-negative integer age"
}else{
  "At least 1 individual in simulated data has a negative age. Problem!"
}
if(all(data$age <= 99)){
  "All individuals in simulated data are age 99 or younger as expected"
}else{
  "At least one individual in the simulated data is 100 or older"
}


# Test that hospitals are all one of the 5 largest in sydney

sydney_hospitals <- c("Royal Prince Alfred",
                      "St. Vincent's Hospital",
                      "Concord Repatriation Hospital",
                      "Westmead Hospital",
                      "Sydney Adventist")

if(all(unique(data$hospital) %in% sydney_hospitals)){
  "The hospitals in the simulated data set match the 5 largest hospitals in Sydney"
} else{
  "Not all of the hospitals in the simulated data set are among the 5 largest in Sydney"
}

# Test that every observation in the simulated data set is between 2003 and 2023
if(all(unique(data$year)) >= 2003 & all(unique(data$year)) <= 2023){
  "The simulated data set contains only patients from the last 20 years"
} else{
  "At least 1 observation in the simulated data set is not from the last 20 years"
}

# Test that the types of cancer in the simulated data set are correct
urban_levels <- c("urban", "rural")

# obviously more types of cancer exist, this simplification is for the sake of 
# sta302 quiz12c
cancer_types <- c( 
  "Lung", "Brain", "Breast", "Bone", "Blood", "Pancreatic", 
  "Liver", "Leukemia", "Lymphoma", "Skin", "Ovarian"
)

if(all(unique(data$type) %in% cancer_types)){
  "The simulated cancer types match the expected ones"
}else{
  "Not all of the simulation cancer type values match the expected cancer types"
}
