library(tidyverse)
library(devtools)
library(readxl)
library(httr)

load_all(".")

# ---- Load English IMD with scores ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_lsoa_england") |>
  dplyr::pull(query_url)

eimd_raw <-
  readr::read_csv(query_url)

# ---- Aggregate IMD into MSOAs ----
eimd <-
  eimd_raw |>
  dplyr::select(
    lsoa11_code = `LSOA code (2011)`,

    IMD_score = `Index of Multiple Deprivation (IMD) Score`,
    IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`,
    IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`,

    Income_score = `Income Score (rate)`,
    Income_rank = `Income Rank (where 1 is most deprived)`,
    Income_decile = `Income Decile (where 1 is most deprived 10% of LSOAs)`,

    Employment_score = `Employment Score (rate)`,
    Employment_rank = `Employment Rank (where 1 is most deprived)`,
    Employment_decile = `Employment Decile (where 1 is most deprived 10% of LSOAs)`,

    Education_score = `Education, Skills and Training Score`,
    Education_rank = `Education, Skills and Training Rank (where 1 is most deprived)`,
    Education_decile = `Education, Skills and Training Decile (where 1 is most deprived 10% of LSOAs)`,

    Health_score = `Health Deprivation and Disability Score`,
    Health_rank = `Health Deprivation and Disability Rank (where 1 is most deprived)`,
    Health_decile = `Health Deprivation and Disability Decile (where 1 is most deprived 10% of LSOAs)`,

    Crime_score = `Crime Score`,
    Crime_rank = `Crime Rank (where 1 is most deprived)`,
    Crime_decile = `Crime Decile (where 1 is most deprived 10% of LSOAs)`,

    Housing_and_Access_score = `Barriers to Housing and Services Score`,
    Housing_and_Access_rank = `Barriers to Housing and Services Rank (where 1 is most deprived)`,
    Housing_and_Access_decile = `Barriers to Housing and Services Decile (where 1 is most deprived 10% of LSOAs)`,

    Environment_score = `Living Environment Score`,
    Environment_rank = `Living Environment Rank (where 1 is most deprived)`,
    Environment_decile = `Living Environment Decile (where 1 is most deprived 10% of LSOAs)`,

    population = `Total population: mid 2015 (excluding prisoners)`
  ) |>

  dplyr::left_join(geographr::lookup_lsoa11_ltla21, by = "lsoa11_code")

# Aggregate into LADs
eimd_lad <-
  eimd |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, ltla21_code, population)

eimd_lad_income   <- eimd |> aggregate_scores(Income_score, Income_rank, Income_decile, ltla21_code, population)
eimd_lad_employ   <- eimd |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, ltla21_code, population)
eimd_lad_edu      <- eimd |> aggregate_scores(Education_score, Education_rank, Education_decile, ltla21_code, population)
eimd_lad_health   <- eimd |> aggregate_scores(Health_score, Health_rank, Health_decile, ltla21_code, population)
eimd_lad_crime    <- eimd |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, ltla21_code, population)
eimd_lad_barriers <- eimd |> aggregate_scores(Housing_and_Access_score, Housing_and_Access_rank, Housing_and_Access_decile, ltla21_code, population)
eimd_lad_env      <- eimd |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, ltla21_code, population)

eimd_lad_income   <- eimd_lad_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
eimd_lad_employ   <- eimd_lad_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
eimd_lad_edu      <- eimd_lad_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
eimd_lad_health   <- eimd_lad_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
eimd_lad_crime    <- eimd_lad_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
eimd_lad_barriers <- eimd_lad_barriers |> dplyr::rename(Housing_and_Access_Proportion = Proportion, Housing_and_Access_Extent = Extent, Housing_and_Access_Score = Score)
eimd_lad_env      <- eimd_lad_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

eimd_lad <-
  eimd_lad  |>
  dplyr::left_join(eimd_lad_income,   by = "ltla21_code") |>
  dplyr::left_join(eimd_lad_employ,   by = "ltla21_code") |>
  dplyr::left_join(eimd_lad_edu,      by = "ltla21_code") |>
  dplyr::left_join(eimd_lad_health,   by = "ltla21_code") |>
  dplyr::left_join(eimd_lad_crime,    by = "ltla21_code") |>
  dplyr::left_join(eimd_lad_barriers, by = "ltla21_code") |>
  dplyr::left_join(eimd_lad_env,      by = "ltla21_code")

# Rename
imd2019_lad21_england <- eimd_lad

# Save output to data/ folder
usethis::use_data(imd2019_lad21_england, overwrite = TRUE)
readr::write_csv(imd2019_lad21_england, "data-raw/imd2019_lad21_england.csv")
