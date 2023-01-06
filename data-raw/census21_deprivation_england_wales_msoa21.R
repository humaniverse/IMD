library(tidyverse)

raw <- read_csv(
  "data-raw/census21_deprivation_england_wales_msoa21.csv",
  skip = 7
) |>
  slice(-7265:-7269)

renamed <- raw |>
  select(
    msoa21_code = mnemonic,
    household_deprived_zero_dimensions_count = `Household is not deprived in any dimension`,
    household_deprived_zero_dimensions_percent = `%...6`,
    household_deprived_one_dimensions_count = `Household is deprived in one dimension`,
    household_deprived_one_dimensions_percent = `%...8`,
    household_deprived_two_dimensions_count = `Household is deprived in two dimensions`,
    household_deprived_two_dimensions_percent = `%...10`,
    household_deprived_three_dimensions_count = `Household is deprived in three dimensions`,
    household_deprived_three_dimensions_percent = `%...12`,
    household_deprived_four_dimensions_count = `Household is deprived in four dimensions`,
    household_deprived_four_dimensions_percent = `%...14`
  )

number_dimensions <- renamed |>
  pivot_longer(
    cols = !msoa21_code
  ) |>
  mutate(
    households_number_deprivation_dimensions = case_when(
      str_detect(name, "zero") ~ 0,
      str_detect(name, "one") ~ 1,
      str_detect(name, "two") ~ 2,
      str_detect(name, "three") ~ 3,
      str_detect(name, "four") ~ 4,
    )
  )

census21_deprivation_england_wales_msoa21 <- number_dimensions |>
  mutate(
    type = if_else(
      str_detect(name, "_count$"),
      "count",
      "percent"
    )
  ) |>
  select(-name) |>
  pivot_wider(names_from = type, values_from = value)

usethis::use_data(census21_deprivation_england_wales_msoa21, overwrite = TRUE)
