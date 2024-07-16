library(tidyverse)
library(geographr)
library(sf)

# Load package
devtools::load_all(".")

# ---- LSOA to LAD lookup ----
# Double-check that Welsh LTLAs didn't change codes between 2021 and 2022
geographr::lookup_ltla_ltla |>
  distinct(ltla21_code, ltla22_code) |>
  filter(str_detect(ltla21_code, "^W")) |>
  filter(ltla21_code != ltla22_code)
#--> They didn't, so we can refer to the 2021 codes as 2022

lsoa_lad <-
  geographr::lookup_lsoa11_ltla21 |>
  select(lsoa11_code, ltla22_code = ltla21_code)

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
  dplyr::select(
    lsoa11_code = `LSOA Code`,
    population = `All Ages`
  ) |>
  dplyr::distinct()

lsoa_pop_wales <-
  lsoa_pop |>
  dplyr::filter(substr(lsoa11_code, 1, 1) == "W")

# ---- Aggregate IMD into MSOAs ----
wimd_lsoa <-
  imd_wales_lsoa |>
  rename(lsoa11_code = lsoa_code) |>
  dplyr::left_join(lsoa_pop, by = "lsoa11_code") |>
  dplyr::left_join(lsoa_lad, by = "lsoa11_code")

# Aggregate into LADs
wimd_lad <-
  wimd_lsoa |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, ltla22_code, population)

wimd_lad_income   <- wimd_lsoa |> aggregate_scores(Income_score, Income_rank, Income_decile, ltla22_code, population)
wimd_lad_employ   <- wimd_lsoa |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, ltla22_code, population)
wimd_lad_edu      <- wimd_lsoa |> aggregate_scores(Education_score, Education_rank, Education_decile, ltla22_code, population)
wimd_lad_health   <- wimd_lsoa |> aggregate_scores(Health_score, Health_rank, Health_decile, ltla22_code, population)
wimd_lad_crime    <- wimd_lsoa |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, ltla22_code, population)
wimd_lad_housing  <- wimd_lsoa |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, ltla22_code, population)
wimd_lad_barriers <- wimd_lsoa |> aggregate_scores(Access_score, Access_rank, Access_decile, ltla22_code, population)
wimd_lad_env      <- wimd_lsoa |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, ltla22_code, population)

wimd_lad_income   <- wimd_lad_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
wimd_lad_employ   <- wimd_lad_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
wimd_lad_edu      <- wimd_lad_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
wimd_lad_health   <- wimd_lad_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
wimd_lad_crime    <- wimd_lad_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
wimd_lad_housing  <- wimd_lad_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
wimd_lad_barriers <- wimd_lad_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)
wimd_lad_env      <- wimd_lad_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

imd2019_wales_ltla22 <-
  wimd_lad |>
  dplyr::left_join(wimd_lad_income,   by = "ltla22_code") |>
  dplyr::left_join(wimd_lad_employ,   by = "ltla22_code") |>
  dplyr::left_join(wimd_lad_edu,      by = "ltla22_code") |>
  dplyr::left_join(wimd_lad_health,   by = "ltla22_code") |>
  dplyr::left_join(wimd_lad_crime,    by = "ltla22_code") |>
  dplyr::left_join(wimd_lad_housing,  by = "ltla22_code") |>
  dplyr::left_join(wimd_lad_barriers, by = "ltla22_code") |>
  dplyr::left_join(wimd_lad_env,      by = "ltla22_code")

# Save output to data/ folder
usethis::use_data(imd2019_wales_ltla22, overwrite = TRUE)
readr::write_csv(imd2019_wales_ltla22, "data-raw/imd2019_wales_ltla22.csv")
