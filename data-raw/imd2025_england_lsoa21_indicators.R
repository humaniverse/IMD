library(tidyverse)
library(readxl)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2025_england_lsoa21_indicators") |>
  pull(query_url)

tf <- tempfile(fileext = ".xlsx")
download.file(query_url, tf, mode = "wb")

imd_sheets <-
  excel_sheets(tf) |>
  set_names()

imd_sheets <- imd_sheets[-1]  # Don't need 'Notes' worksheet

imd_income <- read_excel(tf, sheet = imd_sheets[1])
imd_employment <- read_excel(tf, sheet = imd_sheets[2])
imd_education <- read_excel(tf, sheet = imd_sheets[3])
imd_health <- read_excel(tf, sheet = imd_sheets[4])
imd_barriers <- read_excel(tf, sheet = imd_sheets[5])
imd_env <- read_excel(tf, sheet = imd_sheets[6])

imd2025_england_lsoa21_indicators <-
  imd_income |>
  left_join(imd_employment) |>
  left_join(imd_education) |>
  left_join(imd_health) |>
  left_join(imd_barriers) |>
  left_join(imd_env)

imd2025_england_lsoa21_indicators <-
  imd2025_england_lsoa21_indicators |>
  select(-`LSOA name (2021)`, -`Local Authority District code (2024)`, -`Local Authority District name (2024)`) |>
  rename(lsoa21_code = `LSOA code (2021)`)

# Save output to data/ folder
usethis::use_data(imd2025_england_lsoa21_indicators, overwrite = TRUE)
