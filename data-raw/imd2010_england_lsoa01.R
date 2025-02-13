library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2010_lsoa01_england") |>
  pull(query_url)

imd2010_england_lsoa01 <- read_csv(query_url)

imd2010_england_lsoa01 <-
  imd2010_england_lsoa01 |>
  select(
    lsoa01_code = `LSOA CODE`,
    IMD_rank = `RANK OF IMD SCORE (where 1 is most deprived)`,
    Income_rank = `RANK OF INCOME SCORE (where 1 is most deprived)`,
    Employment_rank = `RANK OF EMPLOYMENT SCORE (where 1 is most deprived)`,
    Health_rank = `RANK OF HEALTH DEPRIVATION AND DISABILITY SCORE (where 1 is most deprived)`,
    Education_rank = `RANK OF EDUCATION SKILLS AND TRAINING SCORE (where 1 is most deprived)`,
    Housing_and_Access_rank = `RANK OF BARRIERS TO HOUSING AND SERVICES SCORE (where 1 is most deprived)`,
    Crime_rank = `RANK OF CRIME SCORE (where 1 is most deprived)`,
    Environment_rank = `RANK OF LIVING ENVIRONMENT SCORE (where 1 is most deprived)`
  ) |>
  dplyr::mutate(
    IMD_decile = as.integer(Hmisc::cut2(IMD_rank, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(Income_rank, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(Employment_rank, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(Health_rank, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(Education_rank, g = 10)),
    Housing_and_Access_decile = as.integer(Hmisc::cut2(Housing_and_Access_rank, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(Crime_rank, g = 10)),
    Environment_decile = as.integer(Hmisc::cut2(Environment_rank, g = 10))
  )

# Save output to data/ folder
usethis::use_data(imd2010_england_lsoa01, overwrite = TRUE)
