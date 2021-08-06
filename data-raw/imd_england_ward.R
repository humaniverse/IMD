# Load package
devtools::load_all(".")

# ---- LSOA to Ward lookup ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "lsoa_ward") |>
  dplyr::pull(query_url)

lsoa_ward <-
  readr::read_csv(query_url)

lsoa_ward <-
  lsoa_ward |>
  dplyr::distinct(
    lsoa_code = LSOA11CD,
    ward_code = WD19CD
  )

# ---- Load English IMD with scores ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_lsoa_england") |>
  dplyr::pull(query_url)

eimd_raw <-
  readr::read_csv(query_url)

# ---- Aggregate IMD into Wards ----
eimd <-
  eimd_raw |>
  dplyr::select(
    lsoa_code = `LSOA code (2011)`,

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

  dplyr::left_join(lsoa_ward, by = "lsoa_code")

# Aggregate into Wards
eimd_ward <-
  eimd |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, ward_code, population)

eimd_ward_income   <- eimd |> aggregate_scores(Income_score, Income_rank, Income_decile, ward_code, population)
eimd_ward_employ   <- eimd |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, ward_code, population)
eimd_ward_edu      <- eimd |> aggregate_scores(Education_score, Education_rank, Education_decile, ward_code, population)
eimd_ward_health   <- eimd |> aggregate_scores(Health_score, Health_rank, Health_decile, ward_code, population)
eimd_ward_crime    <- eimd |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, ward_code, population)
eimd_ward_barriers <- eimd |> aggregate_scores(Housing_and_Access_score, Housing_and_Access_rank, Housing_and_Access_decile, ward_code, population)
eimd_ward_env      <- eimd |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, ward_code, population)

eimd_ward_income   <- eimd_ward_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
eimd_ward_employ   <- eimd_ward_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
eimd_ward_edu      <- eimd_ward_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
eimd_ward_health   <- eimd_ward_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
eimd_ward_crime    <- eimd_ward_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
eimd_ward_barriers <- eimd_ward_barriers |> dplyr::rename(Housing_and_Access_Proportion = Proportion, Housing_and_Access_Extent = Extent, Housing_and_Access_Score = Score)
eimd_ward_env      <- eimd_ward_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

eimd_ward <-
  eimd_ward  |>
  dplyr::left_join(eimd_ward_income,   by = "ward_code") |>
  dplyr::left_join(eimd_ward_employ,   by = "ward_code") |>
  dplyr::left_join(eimd_ward_edu,      by = "ward_code") |>
  dplyr::left_join(eimd_ward_health,   by = "ward_code") |>
  dplyr::left_join(eimd_ward_crime,    by = "ward_code") |>
  dplyr::left_join(eimd_ward_barriers, by = "ward_code") |>
  dplyr::left_join(eimd_ward_env,      by = "ward_code")

# Rename
imd_england_ward <- eimd_ward

# Save output to data/ folder
usethis::use_data(imd_england_ward, overwrite = TRUE)
