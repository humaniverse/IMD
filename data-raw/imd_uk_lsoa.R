library(tidyverse)
library(IMD)

# ---- IMD UK ----
# Decile 1  = most deprived
# Each nation deciled separately

imd_eng <-
  imd_england_lsoa |>
  select(lsoa_code, IMD_decile)

imd_wales <- imd_wales_lsoa |>
  select(lsoa_code, IMD_decile)

imd_scotland <- imd_scotland_dz |>
  select(lsoa_code = dz_code, IMD_decile)

imd_ni <- imd_northern_ireland_soa |>
  select(lsoa_code = soa_code, IMD_decile)

imd_uk_lsoa <- rbind(imd_eng, imd_wales, imd_scotland, imd_ni) |>
  select(lsoa_code,
         `IMD Deciles, 1: most deprived, 10: least deprived` = IMD_decile)

# Save output to data/ folder
usethis::use_data(imd_uk_lsoa, overwrite = TRUE)
readr::write_csv(imd_uk_lsoa, "data-raw/imd_uk_lsoa.csv")
