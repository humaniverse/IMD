library(tidyverse)
library(geographr)
library(sf)

# Load package
devtools::load_all(".")

# ---- Check LTLA codes ----
# Confirming that LTLA 2021 and LTLA 2022 codes are the same
dplyr::symdiff(
  geographr::lookup_ltla_ltla$ltla21_code,
  geographr::lookup_ltla22_ltla23$ltla22_code
)

lookup_lsoa11_ltla23 <-
  geographr::lookup_lsoa11_ltla21 |>
  select(lsoa11_code, ltla22_code = ltla21_code) |>
  left_join(
    lookup_ltla22_ltla23 |> select(ltla22_code, ltla23_code)
  ) |>
  select(-ltla22_code)

# Check that each LSOA only has one LTLA
lookup_lsoa11_ltla23 |>
  count(lsoa11_code, sort = TRUE) |>
  filter(n>1)

# ---- Load English IMD with scores ----
query_url <-
  query_urls |>
  filter(data_set == "imd_lsoa_england") |>
  pull(query_url)

eimd_raw <-
  read_csv(query_url)

# ---- Aggregate IMD into Local Authority Districts (2022 codes) ----
eimd <-
  eimd_raw |>
  select(
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

  left_join(lookup_lsoa11_ltla23)

# Aggregate into ltla23s
eimd_ltla23 <-
  eimd |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, ltla23_code, population)

eimd_ltla23_income   <- eimd |> aggregate_scores(Income_score, Income_rank, Income_decile, ltla23_code, population)
eimd_ltla23_employ   <- eimd |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, ltla23_code, population)
eimd_ltla23_edu      <- eimd |> aggregate_scores(Education_score, Education_rank, Education_decile, ltla23_code, population)
eimd_ltla23_health   <- eimd |> aggregate_scores(Health_score, Health_rank, Health_decile, ltla23_code, population)
eimd_ltla23_crime    <- eimd |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, ltla23_code, population)
eimd_ltla23_barriers <- eimd |> aggregate_scores(Housing_and_Access_score, Housing_and_Access_rank, Housing_and_Access_decile, ltla23_code, population)
eimd_ltla23_env      <- eimd |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, ltla23_code, population)

eimd_ltla23_income   <- eimd_ltla23_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
eimd_ltla23_employ   <- eimd_ltla23_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
eimd_ltla23_edu      <- eimd_ltla23_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
eimd_ltla23_health   <- eimd_ltla23_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
eimd_ltla23_crime    <- eimd_ltla23_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
eimd_ltla23_barriers <- eimd_ltla23_barriers |> dplyr::rename(Housing_and_Access_Proportion = Proportion, Housing_and_Access_Extent = Extent, Housing_and_Access_Score = Score)
eimd_ltla23_env      <- eimd_ltla23_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

eimd_ltla23 <-
  eimd_ltla23  |>
  dplyr::left_join(eimd_ltla23_income,   by = "ltla23_code") |>
  dplyr::left_join(eimd_ltla23_employ,   by = "ltla23_code") |>
  dplyr::left_join(eimd_ltla23_edu,      by = "ltla23_code") |>
  dplyr::left_join(eimd_ltla23_health,   by = "ltla23_code") |>
  dplyr::left_join(eimd_ltla23_crime,    by = "ltla23_code") |>
  dplyr::left_join(eimd_ltla23_barriers, by = "ltla23_code") |>
  dplyr::left_join(eimd_ltla23_env,      by = "ltla23_code")

# Rename
imd2019_england_ltla23 <- eimd_ltla23

# Save output to data/ folder
usethis::use_data(imd2019_england_ltla23, overwrite = TRUE)
