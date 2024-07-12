library(tidyverse)

devtools::load_all()

query_url <-
  query_urls |>
  filter(data_set == "census21_deprivation_ni_sdz21") |>
  pull(query_url)

census21_deprivation_northern_ireland_sdz21 <- read_csv(query_url)

census21_deprivation_northern_ireland_sdz21 <-
  census21_deprivation_northern_ireland_sdz21 |>
  select(
    sdz21_code = `Census 2021 Super Data Zone Code`,
    households_number_deprivation_dimensions = `Household Deprivation Code`,
    count = Count
  ) |>
  mutate(
    households_number_deprivation_dimensions = households_number_deprivation_dimensions - 1
  ) |>

  group_by(sdz21_code) |>
  mutate(total = sum(count)) |>
  ungroup() |>

  mutate(proportion = count / total) |>
  select(-total)

usethis::use_data(census21_deprivation_northern_ireland_sdz21, overwrite = TRUE)
