library(tidyverse)
library(IMD)

# ---- IMD UK ----
# Decile 1  = most deprived
# Each nation deciled separately

imd_eng <-
  imd2025_england_lsoa21 |>
  select(area_code = lsoa21_code, IMD_decile)

imd_wales <- imd2019_wales_lsoa11 |>
  select(area_code = lsoa11_code, IMD_decile)

imd_scotland <- imd2020_scotland_dz11 |>
  select(area_code = dz11_code, IMD_decile)

imd_ni <- imd2017_northern_ireland_soa01 |>
  select(area_code = soa01_code, IMD_decile)

imd_uk_lsoa <- rbind(imd_eng, imd_wales, imd_scotland, imd_ni) |>
  select(area_code, IMD_decile)

# Save output to data/ folder
usethis::use_data(imd_uk_lsoa, overwrite = TRUE)
