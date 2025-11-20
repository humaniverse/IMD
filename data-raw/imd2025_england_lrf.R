library(tidyverse)
library(devtools)
library(readxl)
library(janitor)

load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2025_england_lrf") |>
  pull(query_url)

tf <- tempfile(fileext = ".xlsx")
download.file(query_url, tf, mode = "wb")

imd_sheets <-
  excel_sheets(tf) |>
  set_names()

imd_sheets <- imd_sheets[-1] # Don't need 'Notes' worksheet

imd <- read_excel(tf, sheet = imd_sheets[1])
imd_income <- read_excel(tf, sheet = imd_sheets[2])
imd_employment <- read_excel(tf, sheet = imd_sheets[3])
imd_education <- read_excel(tf, sheet = imd_sheets[4])
imd_health <- read_excel(tf, sheet = imd_sheets[5])
imd_crime <- read_excel(tf, sheet = imd_sheets[6])
imd_barriers <- read_excel(tf, sheet = imd_sheets[7])
imd_env <- read_excel(tf, sheet = imd_sheets[8])

imd_lrf <-
  imd |>
  left_join(imd_income) |>
  left_join(imd_employment) |>
  left_join(imd_education) |>
  left_join(imd_health) |>
  left_join(imd_crime) |>
  left_join(imd_barriers) |>
  left_join(imd_env)

imd2025_england_lrf <-
  imd_lrf |>
  rename(
    lrf24_code = `Local Resilience Forum code (2024)`,
    lrf24_name = `Local Resilience Forum Name (2024)`
  ) |>
  rename_with(~ str_replace_all(.x, "%", " percent")) |>
  clean_names()

# Save output to data/ folder
usethis::use_data(imd2025_england_lrf, overwrite = TRUE)
