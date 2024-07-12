library(tidyverse)
library(geographr)
library(sf)

# Load package
devtools::load_all(".")

# ---- Check LTLA codes ----
# Confirming that LTLA 2021 and LTLA 2022 codes are the same for Wales
dplyr::symdiff(
  geographr::lookup_ltla_ltla |>
    filter(str_detect(ltla21_code, "W")) |>
    pull(ltla21_code),

  geographr::lookup_ltla22_ltla23 |>
    filter(str_detect(ltla22_code, "W")) |>
    pull(ltla22_code)
)

# ---- Population estimates in LSOAs ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "pop_lsoa") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".zip"))
)

# Where to store the unzipped files temporarily
td <- tempdir()
unzip_dir <- file.path(td, "population-lsoa")

# Delete the temp folder if it already exists
if (dir.exists(unzip_dir))
  unlink(unzip_dir, recursive = TRUE)

dir.create(unzip_dir)

unzip(tf, exdir = unzip_dir)

lsoa_pop <-
  readxl::read_excel(
    file.path(unzip_dir, "SAPE22DT2-mid-2019-lsoa-syoa-estimates-unformatted.xlsx"),
    sheet = "Mid-2019 Persons",
    skip = 4
  )

# Select and rename vars
lsoa_pop <-
  lsoa_pop |>
  select(
    lsoa11_code = `LSOA Code`,
    population = `All Ages`
  ) |>
  distinct()

lsoa_pop_wales <-
  lsoa_pop |>
  filter(substr(lsoa11_code, 1, 1) == "W")

# ---- Aggregate IMD into MSOAs ----
wimd_lsoa <-
  imd_wales_lsoa |>

  rename(lsoa11_code = lsoa_code) |>

  # We don't have IMD scores for Wales so just set them as zero
  mutate(
    IMD_score = 0,
    Income_score = 0,
    Employment_score = 0,
    Education_score = 0,
    Health_score = 0,
    Crime_score = 0,
    Housing_score = 0,
    Access_score = 0,
    Environment_score = 0
  ) |>

  left_join(lsoa_pop) |>
  left_join(
    geographr::lookup_lsoa11_ltla21 |>
      select(lsoa11_code, ltla22_code = ltla21_code)
  )

# Aggregate into LADs
wimd_ltla22 <-
  wimd_lsoa |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, ltla22_code, population)

wimd_ltla22_income   <- wimd_lsoa |> aggregate_scores(Income_score, Income_rank, Income_decile, ltla22_code, population)
wimd_ltla22_employ   <- wimd_lsoa |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, ltla22_code, population)
wimd_ltla22_edu      <- wimd_lsoa |> aggregate_scores(Education_score, Education_rank, Education_decile, ltla22_code, population)
wimd_ltla22_health   <- wimd_lsoa |> aggregate_scores(Health_score, Health_rank, Health_decile, ltla22_code, population)
wimd_ltla22_crime    <- wimd_lsoa |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, ltla22_code, population)
wimd_ltla22_housing  <- wimd_lsoa |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, ltla22_code, population)
wimd_ltla22_barriers <- wimd_lsoa |> aggregate_scores(Access_score, Access_rank, Access_decile, ltla22_code, population)
wimd_ltla22_env      <- wimd_lsoa |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, ltla22_code, population)

wimd_ltla22_income   <- wimd_ltla22_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
wimd_ltla22_employ   <- wimd_ltla22_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
wimd_ltla22_edu      <- wimd_ltla22_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
wimd_ltla22_health   <- wimd_ltla22_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
wimd_ltla22_crime    <- wimd_ltla22_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
wimd_ltla22_housing  <- wimd_ltla22_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
wimd_ltla22_barriers <- wimd_ltla22_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)
wimd_ltla22_env      <- wimd_ltla22_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

imd2019_wales_ltla22 <-
  wimd_ltla22 |>
  left_join(wimd_ltla22_income,   by = "ltla22_code") |>
  left_join(wimd_ltla22_employ,   by = "ltla22_code") |>
  left_join(wimd_ltla22_edu,      by = "ltla22_code") |>
  left_join(wimd_ltla22_health,   by = "ltla22_code") |>
  left_join(wimd_ltla22_crime,    by = "ltla22_code") |>
  left_join(wimd_ltla22_housing,  by = "ltla22_code") |>
  left_join(wimd_ltla22_barriers, by = "ltla22_code") |>
  left_join(wimd_ltla22_env,      by = "ltla22_code") |>

  # Don't have scores for Wales so drop these columns
  select(-ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd2019_wales_ltla22, overwrite = TRUE)
readr::write_csv(imd2019_wales_ltla22, "data-raw/imd2019_wales_ltla22.csv")
