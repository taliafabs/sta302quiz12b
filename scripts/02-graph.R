#### Preamble ####
# Purpose: Create graphs to gain an understanding of how hospital, year, age, and type of cancer
# affect the chance that a patient in one of the 5 largest hospitals in Sydney will die.
# Author: Talia Fabregas
# Date: 29 March 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - run 00-simulate_data.R first

#### Workplace Setup ####
library(arrow)
library(tidyverse)
library(janitor)
library(ggplot2)

# read in the data
data <- read_parquet("data/simulated_cancer_data.parquet")

#### Graphs ####

# Graph the number of cancer patients that died each year across Sydney's 5 largest hospitals
patient_deaths <- data %>%
  group_by(year) %>%
  summarise(total_deaths = sum(patient_died))

ggplot(data = patient_deaths, aes(x = year, y = total_deaths)) +
  geom_line() +
  geom_point() +  # Add points for each year
  labs(title = "Number of Cancer Deaths in Sydney's 5 Largest Hositals, 2003-2023",
       x = "Year",
       y = "Number of Patients Died") +
  theme_minimal()