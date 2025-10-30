library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2025_england_lsoa21") |>
  pull(query_url)

imd_england_lsoa <-
  read_csv(query_url)

imd2025_england_lsoa21 <-
  imd_england_lsoa |>
  select(
    lsoa11_code = `LSOA code (2021)`,

    IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`,
    Income_decile = `Income Decile (where 1 is most deprived 10% of LSOAs)`,
    Employment_decile = `Employment Decile (where 1 is most deprived 10% of LSOAs)`,
    Education_decile = `Education, Skills and Training Decile (where 1 is most deprived 10% of LSOAs)`,
    Health_decile = `Health Deprivation and Disability Decile (where 1 is most deprived 10% of LSOAs)`,
    Crime_decile = `Crime Decile (where 1 is most deprived 10% of LSOAs)`,
    Housing_and_Services_decile = `Barriers to Housing and Services Decile (where 1 is most deprived 10% of LSOAs)`,
    Environment_decile = `Living Environment Decile (where 1 is most deprived 10% of LSOAs)`,

    IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`,
    Income_rank = `Income Rank (where 1 is most deprived)`,
    Employment_rank = `Employment Rank (where 1 is most deprived)`,
    Education_rank = `Education, Skills and Training Rank (where 1 is most deprived)`,
    Health_rank = `Health Deprivation and Disability Rank (where 1 is most deprived)`,
    Crime_rank = `Crime Rank (where 1 is most deprived)`,
    Housing_and_Services_rank = `Barriers to Housing and Services Rank (where 1 is most deprived)`,
    Environment_rank = `Living Environment Rank (where 1 is most deprived)`,

    IMD_score = `Index of Multiple Deprivation (IMD) Score`,
    Income_score = `Income Score (rate)`,
    Employment_score = `Employment Score (rate)`,
    Education_score = `Education, Skills and Training Score`,
    Health_score = `Health Deprivation and Disability Score`,
    Crime_score = `Crime Score`,
    Housing_and_Services_score = `Barriers to Housing and Services Score`,
    Environment_score = `Living Environment Score`
  )

# Save output to data/ folder
usethis::use_data(imd2025_england_lsoa21, overwrite = TRUE)
