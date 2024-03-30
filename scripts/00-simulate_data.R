#### Preamble ####
# Purpose: Simulate a data set where the chance that a cancer patient in one of 
# the 5 largest hospitals in Sydney, Australia
# dies depends on the hospital they were treated at, their age, the year, and the type of cancer
# Author: Talia Fabregas, Fatimah Yunusa, Aamishi Sandeep
# Date: 29 March 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Work space setup ####
# install.packages("arrow")
library(tidyverse)
library(janitor)
library(arrow)

# set seed for reproducibility
set.seed(853)

# set the number of observations to 1000
num_obs <- 10000

cancer_types <- c( 
  "Lung", "Brain", "Breast", "Bone", "Blood", "Pancreatic", 
  "Liver", "Leukemia", "Lymphoma", "Skin", "Ovarian"
)

sydney_hospitals <- c("Royal Prince Alfred",
                      "St. Vincent's Hospital",
                      "Concord Repatriation Hospital",
                      "Westmead Hospital",
                      "Sydney Adventist")



#### Simulate data ####
simulated_cancer_data <- tibble(
  patient_died=sample(1:0, size=num_obs, replace=TRUE),
  # year
  year=sample(2003:2023, size=num_obs, replace=TRUE),
  # age
  age = sample(0:99, size=num_obs, replace=TRUE),
  # hospital
  hospital = sample(sydney_hospitals, size = num_obs, replace = TRUE),
  # type
  type = sample(cancer_types, size = num_obs, replace = TRUE)
)

# make hospital and type of cancer data 
simulated_cancer_data$hospital <- as.factor(simulated_cancer_data$hospital)
simulated_cancer_data$type <- as.factor(simulated_cancer_data$type)

#### Save data ####

# save as a parquet under data/simulated_data
write_parquet(simulated_cancer_data, 
              "data/simulated_cancer_data.parquet")







