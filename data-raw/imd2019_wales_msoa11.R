library(tidyverse)

# Load package
devtools::load_all(".")

# ---- LSOA to MSOA lookup ----
lsoa_msoa <-
  geographr::lookup_lsoa11_msoa11 |>
  filter(str_detect(lsoa11_code, "^W"))

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
  imd2019_wales_lsoa11 |>
  dplyr::left_join(lsoa_pop, by = "lsoa11_code") |>
  dplyr::left_join(lsoa_msoa, by = "lsoa11_code")

# Aggregate into MSOAs
wimd_msoa <-
  wimd_lsoa |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, msoa11_code, population)

wimd_msoa_income   <- wimd_lsoa |> aggregate_scores(Income_score, Income_rank, Income_decile, msoa11_code, population)
wimd_msoa_employ   <- wimd_lsoa |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, msoa11_code, population)
wimd_msoa_edu      <- wimd_lsoa |> aggregate_scores(Education_score, Education_rank, Education_decile, msoa11_code, population)
wimd_msoa_health   <- wimd_lsoa |> aggregate_scores(Health_score, Health_rank, Health_decile, msoa11_code, population)
wimd_msoa_crime    <- wimd_lsoa |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, msoa11_code, population)
wimd_msoa_housing  <- wimd_lsoa |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, msoa11_code, population)
wimd_msoa_barriers <- wimd_lsoa |> aggregate_scores(Access_score, Access_rank, Access_decile, msoa11_code, population)
wimd_msoa_env      <- wimd_lsoa |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, msoa11_code, population)

wimd_msoa_income   <- wimd_msoa_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
wimd_msoa_employ   <- wimd_msoa_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
wimd_msoa_edu      <- wimd_msoa_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
wimd_msoa_health   <- wimd_msoa_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
wimd_msoa_crime    <- wimd_msoa_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
wimd_msoa_housing  <- wimd_msoa_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
wimd_msoa_barriers <- wimd_msoa_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)
wimd_msoa_env      <- wimd_msoa_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

imd2019_wales_msoa11 <-
  wimd_msoa |>
  dplyr::left_join(wimd_msoa_income,   by = "msoa11_code") |>
  dplyr::left_join(wimd_msoa_employ,   by = "msoa11_code") |>
  dplyr::left_join(wimd_msoa_edu,      by = "msoa11_code") |>
  dplyr::left_join(wimd_msoa_health,   by = "msoa11_code") |>
  dplyr::left_join(wimd_msoa_crime,    by = "msoa11_code") |>
  dplyr::left_join(wimd_msoa_housing,  by = "msoa11_code") |>
  dplyr::left_join(wimd_msoa_barriers, by = "msoa11_code") |>
  dplyr::left_join(wimd_msoa_env,      by = "msoa11_code")

# Save output to data/ folder
usethis::use_data(imd2019_wales_msoa11, overwrite = TRUE)
