library(tidyverse)

# Load package
devtools::load_all(".")

# Read file
# No stable link for file, dataset not in StatsWales API
# URL: https://stats.gov.wales/en-GB/f30cc8bc-8e97-449e-96a4-77b0400262d1#downloads
# Manually download the file
# Filename: Welsh Index of Multiple Deprivation 2025 local authority deprivation profiles

raw <- read_csv("data-raw/welsh-index-of-multiple-deprivation-wimd-2025-local-authority-deprivation-profiles-v4.csv")

imd2025_wales_ltla24 <- raw |>
  select(
    ltla24_code = `Area code`,
    domain = Domain,
    deprivation_group = `Deprivation group`,
    data_description = `Data description`,
    data_values = `Data values`
  )

# Save output to data/ folder
usethis::use_data(imd2025_wales_ltla24, overwrite = TRUE)
