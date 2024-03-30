#### Preamble ####
# Purpose: Use logistic regression to estimate a model where whether or not a cancer patient
# in one of the 5 largest hospitals in Sydney, Australia depends on the year, 
# the hospital they were treated at, their age, and the type of cancer they had
# Author: Talia Fabregas
# Date: 29 March 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - run 00-simulate_data.R first

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)
library(modelsummary)

# set seed for reproducibility 
set.seed(853)

#### Read Data ####
simulated_data <- read_parquet("data/simulated_cancer_data.parquet")

# build the logistic regression model using stan_glm and the default priors
sydney_cancer_model <- stan_glm(
  formula = patient_died ~ year + hospital + age + type,
  data = simulated_data,
  family = binomial(link="logit"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 853
)

#### Save model ####
saveRDS(sydney_cancer_model, file="model/sydney_cancer_model.RDS")
