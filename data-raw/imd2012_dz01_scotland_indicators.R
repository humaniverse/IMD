library(tidyverse)
library(devtools)
library(compositr)
library(readxl)

# Load package
load_all(".")

# ---- Income ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_income") |>
  pull(query_url)

tf <- download_file(query_url, ".xls")

income <- read_excel(tf)

income <-
  income |>
  rename(dz11_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...7`, -Notes)

# ---- Employment ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_employment") |>
  pull(query_url)

tf <- download_file(query_url, ".xls")

employment <- read_excel(tf)

employment <-
  employment |>
  rename(dz11_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...7`, -Notes)

# ---- Health ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_health") |>
  pull(query_url)

tf <- download_file(query_url, ".xls")

health <- read_excel(tf)

health <-
  health |>
  rename(dz11_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...12`, -Notes)

# ---- Education ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_education") |>
  pull(query_url)

tf <- download_file(query_url, ".xls")

education <- read_excel(tf)

education <-
  education |>
  rename(dz11_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...10`, -Notes)

# ---- Housing ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_housing") |>
  pull(query_url)

tf <- download_file(query_url, ".xls")

housing <- read_excel(tf)

housing <-
  housing |>
  rename(dz11_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...8`, -Notes)

# ---- Access ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_access") |>
  pull(query_url)

tf <- download_file(query_url, ".xls")

access <- read_excel(tf)

access <-
  access |>
  rename(dz11_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...16`, -Notes)

# ---- Crime ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_crime") |>
  pull(query_url)

tf <- download_file(query_url, ".xls")

crime <- read_excel(tf)

crime <-
  crime |>
  rename(dz11_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...7`, -Notes)

# ---- Combine indicators ----
imd2012_dz01_scotland_indicators <-
  income |>
  left_join(employment) |>
  left_join(health) |>
  left_join(education) |>
  left_join(housing) |>
  left_join(access) |>
  left_join(crime)

# Save output to data/ folder
usethis::use_data(imd2012_dz01_scotland_indicators, overwrite = TRUE)
readr::write_csv(imd2012_dz01_scotland_indicators, "data-raw/imd2012_dz01_scotland_indicators.csv")
