library(tidyverse)
library(devtools)
library(readODS)

# Load package
load_all(".")

# Get ranks and deciles
query_url <-
  query_urls |>
  filter(data_set == "imd2025_lsoa21_wales_ranks") |>
  pull(query_url)

tf <- tempfile(fileext = ".ods")

request(query_url) |>
  req_perform(path = tf)

imd_wales_lsoa_ranks <-
  readODS::read_ods(tf, sheet = "WIMD_2025_ranks", skip = 2)

names(imd_wales_lsoa_ranks) <- str_trim(names(imd_wales_lsoa_ranks))

ranks_deciles <-
  imd_wales_lsoa_ranks |>

  select(-ncol(imd_wales_lsoa_ranks)) |>
  as_tibble() |>

  select(
    lsoa21_code = `LSOA code`,
    IMD_rank = `WIMD 2025`,
    Income_rank = `Income`,
    Employment_rank = Employment,
    Health_rank = Health,
    Education_rank = Education,
    Access_rank = `Access to Services`,
    Housing_rank = Housing,
    Crime_rank = `Community Safety`,
    Environment_rank = `Physical Environment`,
  ) |>

  mutate(
    IMD_decile = ntile(`IMD_rank`, 10),
    Income_decile = ntile(`Income_rank`, 10),
    Employment_decile = ntile(`Employment_rank`, 10),
    Health_decile = ntile(`Health_rank`, 10),
    Education_decile = ntile(`Education_rank`, 10),
    Access_decile = ntile(`Access_rank`, 10),
    Housing_decile = ntile(`Housing_rank`, 10),
    Crime_decile = ntile(`Crime_rank`, 10),
    Environment_decile = ntile(`Environment_rank`, 10)
  )

# Get scores
query_url <-
  query_urls |>
  filter(data_set == "imd2025_lsoa21_wales_scores") |>
  pull(query_url)

tf <- tempfile(fileext = ".ods")

request(query_url) |>
  req_perform(path = tf)

imd_wales_lsoa_scores <-
  readODS::read_ods(tf, sheet = "WIMD_2025_ranks", skip = 2)

names(imd_wales_lsoa_scores) <- str_trim(names(imd_wales_lsoa_scores))

scores <-
  imd_wales_lsoa_scores |>

  select(-ncol(imd_wales_lsoa_scores)) |>
  as_tibble() |>

  select(
    lsoa21_code = `LSOA code`,
    IMD_score = `WIMD 2025`,
    Income_score = `Income`,
    Employment_score = Employment,
    Health_score = Health,
    Education_score = Education,
    Access_score = `Access to Services`,
    Housing_score = Housing,
    Crime_score = `Community Safety`,
    Environment_score = `Physical Environment`,
  )

# Combine scores, ranks, deciles
imd2025_wales_lsoa21 <- ranks_deciles |>
  left_join(scores)

# Save output to data/ folder
usethis::use_data(imd2025_wales_lsoa21, overwrite = TRUE)
