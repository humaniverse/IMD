library(tidyverse)
library(compositr)
library(readxl)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd_england_indicators") |>
  pull(query_url)

tf <- download_file(query_url, ".xlsx")

imd_sheets <-
  excel_sheets(tf) |>
  set_names()

imd_sheets <- imd_sheets[-1]  # Don't need 'Notes' worksheet

# imd_indicators <-
#   imd_sheets |>
#   map_df(~read_excel(tf, sheet = .x))
#
# imd_indicators |>
#   select(-`LSOA name (2011)`, -`Local Authority District code (2019)`, -`Local Authority District name (2019)`) |>
#   rename(lsoa11_code = `LSOA code (2011)`)

imd_income <- read_excel(tf, sheet = imd_sheets[1])
imd_employment <- read_excel(tf, sheet = imd_sheets[2])
imd_education <- read_excel(tf, sheet = imd_sheets[3])
imd_health <- read_excel(tf, sheet = imd_sheets[4])
imd_barriers <- read_excel(tf, sheet = imd_sheets[5])
imd_env <- read_excel(tf, sheet = imd_sheets[6])

imd2019_england_lsoa11_indicators <-
  imd_income |>
  left_join(imd_employment) |>
  left_join(imd_education) |>
  left_join(imd_health) |>
  left_join(imd_barriers) |>
  left_join(imd_env)

imd2019_england_lsoa11_indicators <-
  imd2019_england_lsoa11_indicators |>
  select(-`LSOA name (2011)`, -`Local Authority District code (2019)`, -`Local Authority District name (2019)`) |>
  rename(lsoa11_code = `LSOA code (2011)`)

# Save output to data/ folder
usethis::use_data(imd2019_england_lsoa11_indicators, overwrite = TRUE)
