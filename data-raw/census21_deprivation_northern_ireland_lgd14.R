library(tidyverse)

devtools::load_all()

query_url <-
  query_urls |>
  filter(data_set == "census21_deprivation_ni_lgd14") |>
  pull(query_url)

census21_deprivation_northern_ireland_lgd14 <- read_csv(query_url)

census21_deprivation_northern_ireland_lgd14 <-
  census21_deprivation_northern_ireland_lgd14 |>
  select(
    lgd14_code = `Local Government District 2014 Code`,
    households_number_deprivation_dimensions = `Household Deprivation Code`,
    count = Count
  ) |>
  mutate(
    households_number_deprivation_dimensions = households_number_deprivation_dimensions - 1
  ) |>

  group_by(lgd14_code) |>
  mutate(total = sum(count)) |>
  ungroup() |>

  mutate(proportion = count / total) |>
  select(-total)

usethis::use_data(census21_deprivation_northern_ireland_lgd14, overwrite = TRUE)
