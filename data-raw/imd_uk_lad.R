library(tidyverse)
library(IMD)

# ---- IMD UK ----
# Higher score = more deprived
# Higher decile  = more deprived
# Each nation deciled separately

imd_eng <-
  imd_england_lad |>
  select(Code = lad_code, imd_score = Score) |>
  mutate(imd_deciles = ntile(imd_score, 10))

imd_wales <- imd_wales_lad |>
  select(Code = lad_code, imd_score = Extent) |>
  mutate(imd_deciles = ntile(imd_score, 10))

imd_scotland <- imd_scotland_lad |>
  select(Code = lad_code, imd_score = Extent) |>
  mutate(imd_deciles = ntile(imd_score, 10))

imd_ni <- imd_northern_ireland_lad |>
  select(Code = lad_code, imd_score = Extent) |>
  mutate(imd_deciles = ntile(imd_score, 10))

imd_uk_lad <- rbind(imd_eng, imd_wales, imd_scotland, imd_ni) |>
  mutate(`IMD Deciles, 1: most deprived, 10: least deprived` = 11-imd_deciles) |>
  select(lad_code = Code,
         `IMD Deciles, 1: most deprived, 10: least deprived`)

# Save output to data/ folder
usethis::use_data(imd_uk_lad, overwrite = TRUE)
readr::write_csv(imd_uk_lad, "data-raw/imd_uk_lad.csv")
