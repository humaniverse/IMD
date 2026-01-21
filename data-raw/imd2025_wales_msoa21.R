library(tidyverse)

# Load package
devtools::load_all(".")

# Read file
# No stable link for file, dataset not in StatsWales API
# URL: https://stats.gov.wales/en-GB/d22b81a1-6c99-4527-986b-2a529567cfba
# Manually download the file
# Filename: Welsh Index of Multiple Deprivation 2025 lmiddle layer super output area deprivation profiles

raw <- read_csv("data-raw/welsh-index-of-multiple-deprivation-wimd-2025-middle-layer-super-output-area-msoa-deprivation-profiles-v4.csv")

imd2025_wales_msoa21 <- raw |>
  select(
    msoa21_code = `Area code`,
    domain = Domain,
    deprivation_group = `Deprivation group`,
    data_description = `Data description`,
    data_values = `Data values`
  )

# Save output to data/ folder
usethis::use_data(imd2025_wales_msoa21, overwrite = TRUE)
