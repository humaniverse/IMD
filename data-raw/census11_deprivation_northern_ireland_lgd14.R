library(tidyverse)
library(compositr)
library(readxl)

devtools::load_all()

query_url <-
  query_urls |>
  filter(data_set == "census11_deprivation_ni_lgd14") |>
  pull(query_url)

tf <- download_file(query_url, ".xlsx")

census11_deprivation_northern_ireland_lgd14 <- read_excel(tf, sheet = "CT0590NI", skip = 6)

census11_deprivation_northern_ireland_lgd14 <-
  census11_deprivation_northern_ireland_lgd14 |>
  filter(Geography != "Northern Ireland") |>
  select(
    lgd14_code = `Geography code`,
    # total = `All households`,
    household_deprived_zero_dimensions_count = `Household is not deprived in any dimension`,
    household_deprived_one_dimensions_count = `Household is deprived in 1 dimension`,
    household_deprived_two_dimensions_count = `Household is deprived in 2 dimensions`,
    household_deprived_three_dimensions_count = `Household is deprived in 3 dimensions`,
    household_deprived_four_dimensions_count = `Household is deprived in 4 dimensions`,
  ) |>

  pivot_longer(
    cols = !lgd14_code,
    values_to = "count"
  ) |>
  mutate(
    households_number_deprivation_dimensions = case_when(
      str_detect(name, "zero") ~ 0,
      str_detect(name, "one") ~ 1,
      str_detect(name, "two") ~ 2,
      str_detect(name, "three") ~ 3,
      str_detect(name, "four") ~ 4,
    )
  ) |>

  select(-name) |>

  group_by(lgd14_code) |>
  mutate(total = sum(count)) |>
  ungroup() |>

  mutate(proportion = count / total) |>
  select(lgd14_code, households_number_deprivation_dimensions, count, proportion)

usethis::use_data(census11_deprivation_northern_ireland_lgd14, overwrite = TRUE)
