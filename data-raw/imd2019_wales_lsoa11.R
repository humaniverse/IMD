library(tidyverse)

# Load package
devtools::load_all(".")

# ---- LSOA-level IMD based on ranks ----
# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_lsoa_wales") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".ods"))
)

imd_wales_lsoa <-
  readODS::read_ods(tf, sheet = "WIMD_2019_ranks", skip = 2)

names(imd_wales_lsoa) <- str_trim(names(imd_wales_lsoa))

imd_wales_lsoa <-
  imd_wales_lsoa |>

  # Remove final column which is `NA`
  dplyr::select(-ncol(imd_wales_lsoa)) |>
  tibble::as_tibble() |>

  dplyr::mutate(
    IMD_decile = as.integer(Hmisc::cut2(`WIMD 2019`, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(`Income`, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(Employment, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(Health, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(Education, g = 10)),
    Housing_decile = as.integer(Hmisc::cut2(Housing, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(`Access to Services`, g = 10)),
    Environment_decile = as.integer(Hmisc::cut2(`Physical Environment`, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(`Community Safety`, g = 10))
  ) |>

  dplyr::select(
    lsoa11_code = `LSOA code`,

    dplyr::ends_with("_decile"),

    IMD_rank = `WIMD 2019`,
    Income_rank = `Income`,
    Employment_rank = Employment,
    Health_rank = Health,
    Education_rank = Education,
    Housing_rank = Housing,
    Access_rank = `Access to Services`,
    Environment_rank = `Physical Environment`,
    Crime_rank = `Community Safety`
  )

# ---- Load IMD scores ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_lsoa_wales_scores") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".ods"))
)

imd_wales_lsoa_scores <-
  readODS::read_ods(tf, sheet = "Data", skip = 3)

# Remove trailing spaces
names(imd_wales_lsoa_scores) <- str_trim(names(imd_wales_lsoa_scores))

imd_wales_lsoa_scores <-
  imd_wales_lsoa_scores |>
  tibble::as_tibble() |>
  dplyr::select(
    lsoa11_code = `LSOA code`,
    IMD_score = `WIMD 2019`,
    Income_score = Income,
    Employment_score = Employment,
    Education_score = Education,
    Health_score = Health,
    Crime_score = `Community Safety`,
    Housing_score = Housing,
    Access_score = `Access to Services`,
    Environment_score = `Physical Environment`
  )

# Merge scores
imd2019_wales_lsoa11 <-
  imd_wales_lsoa |>
  left_join(imd_wales_lsoa_scores)

# Save output to data/ folder
usethis::use_data(imd2019_wales_lsoa11, overwrite = TRUE)
