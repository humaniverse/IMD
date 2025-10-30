library(tidyverse)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd2025_england_lsoa21") |>
  dplyr::pull(query_url)

imd_england_lsoa <-
  read_csv(query_url)

imd2025_england_lsoa21_subdomains <-
  imd_england_lsoa |>
  dplyr::select(
    lsoa21_code = `LSOA code (2021)`,
    children_and_young_people_score = 35,
    children_and_young_people_rank = 36,
    children_and_young_people_decile = 37,
    adult_skills_score = 38,
    adult_skills_rank = 39,
    adult_skills_decile = 40,
    geographical_barriers_score = 41,
    geographical_barriers_rank = 42,
    geographical_barriers_decile = 43,
    wider_barriers_score = 44,
    wider_barriers_rank = 45,
    wider_barriers_decile = 46,
    indoors_score = 47,
    indoors_rank = 48,
    indoors_decile = 49,
    outdoors_score = 50,
    outdoors_rank = 51,
    outdoors_decile = 52
  )

# Save output to data/ folder
usethis::use_data(imd2025_england_lsoa21_subdomains, overwrite = TRUE)
