library(tidyverse)
library(devtools)
library(readxl)

# Load package
load_all(".")

# ---- Income ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_income") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

income <- read_excel(tf)

income <-
  income |>
  rename(dz01_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...7`, -Notes)

# ---- Employment ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_employment") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

employment <- read_excel(tf)

employment <-
  employment |>
  rename(dz01_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...7`, -Notes)

# ---- Health ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_health") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

health <- read_excel(tf)

health <-
  health |>
  rename(dz01_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...12`, -Notes)

# ---- Education ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_education") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

education <- read_excel(tf)

education <-
  education |>
  rename(dz01_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...10`, -Notes)

# ---- Housing ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_housing") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

housing <- read_excel(tf)

housing <-
  housing |>
  rename(dz01_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...8`, -Notes)

# ---- Access ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_access") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

access <- read_excel(tf)

access <-
  access |>
  rename(dz01_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...16`, -Notes)

# ---- Crime ----
query_url <-
  query_urls |>
  filter(data_set == "imd2012_dz01_scotland_indicators_crime") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

crime <- read_excel(tf)

crime <-
  crime |>
  rename(dz01_code = `Data Zone`) |>
  select(-`Local Authority Code`, -`...7`, -Notes)

# ---- Combine indicators ----
imd2012_scotland_dz01_indicators <-
  income |>
  left_join(employment) |>
  left_join(health) |>
  left_join(education) |>
  left_join(housing) |>
  left_join(access) |>
  left_join(crime)

# Save output to data/ folder
usethis::use_data(imd2012_scotland_dz01_indicators, overwrite = TRUE)
