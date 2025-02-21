library(tidyverse)

# Manually downloaded from https://simd.scot, since the historical links no longer work via https://webarchive.nrscotland.gov.uk/
simd_raw <- read_csv("data-raw/simd2012_data_00410767_plusintervals.csv")

imd2012_scotland_dz01 <-
  simd_raw |>
  select(
    dz01_code = `Data Zone`,

    IMD_rank = `Overall SIMD 2012 Rank`,
    Income_rank = `Income domain 2012 rank`,
    Employment_rank = `Employment domain 2012 rank`,
    Health_rank = `Health domain 2012 rank`,
    Education_rank = `Education, Skills and Training domain 2012 rank`,
    Housing_rank = `Housing domain rank 2004, 2006, 2009 & 2012`,
    Access_rank = `Geographic Access domain 2012 rank`,
    Crime_rank = `SIMD Crime 2012 rank`,

    IMD_decile = Decile
  ) |>
  mutate(
    Income_decile = as.integer(Hmisc::cut2(`Income_rank`, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(`Employment_rank`, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(`Health_rank`, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(`Education_rank`, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(`Access_rank`, g = 10)),
    Housing_decile = as.integer(Hmisc::cut2(`Housing_rank`, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(`Crime_rank`, g = 10))
  )

# Save output to data/ folder
usethis::use_data(imd2012_scotland_dz01, overwrite = TRUE)
