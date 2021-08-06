# Load package
devtools::load_all(".")

# ---- LSOA to MSOA lookup ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "lsoa_msoa_lad") |>
  dplyr::pull(query_url)

lsoa_msoa <-
  readr::read_csv(query_url)

dz_iz <-
  lsoa_msoa |>
  dplyr::distinct(
    dz_code = LSOA11CD,
    iz_code = MSOA11CD
  ) |>
  dplyr::filter(substr(dz_code, 1, 1) == "S")

# ---- Population estimates in Data Zones ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "pop_dz") |>
  dplyr::pull(query_url)

dz_pop <- readr::read_csv(query_url)

dz_pop <-
  dz_pop |>

  # Keep only latest year, don't include Scotland totals, and combine female and males estimates
  dplyr::filter(Year == max(Year) & DataZone != "S92000003" & Sex == "All") |>

  # Select and rename vars
  dplyr::select(
    dz_code = DataZone,
    population = AllAges
  )

# ---- Aggregate IMD into MSOAs ----
simd_dz <-
  imd_scotland_dz |>

  # We don't have IMD scores for Wales so just set them as zero
  dplyr::mutate(
    IMD_score = 0,
    Income_score = 0,
    Employment_score = 0,
    Education_score = 0,
    Health_score = 0,
    Crime_score = 0,
    Housing_score = 0,
    Access_score = 0
  ) |>

  dplyr::left_join(dz_pop, by = "dz_code") |>
  dplyr::left_join(dz_iz, by = "dz_code")

# Aggregate into MSOAs
simd_iz <-
  simd_dz |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, iz_code, population)

simd_iz_income   <- simd_dz |> aggregate_scores(Income_score, Income_rank, Income_decile, iz_code, population)
simd_iz_employ   <- simd_dz |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, iz_code, population)
simd_iz_edu      <- simd_dz |> aggregate_scores(Education_score, Education_rank, Education_decile, iz_code, population)
simd_iz_health   <- simd_dz |> aggregate_scores(Health_score, Health_rank, Health_decile, iz_code, population)
simd_iz_crime    <- simd_dz |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, iz_code, population)
simd_iz_housing  <- simd_dz |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, iz_code, population)
simd_iz_barriers <- simd_dz |> aggregate_scores(Access_score, Access_rank, Access_decile, iz_code, population)

simd_iz_income   <- simd_iz_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
simd_iz_employ   <- simd_iz_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
simd_iz_edu      <- simd_iz_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
simd_iz_health   <- simd_iz_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
simd_iz_crime    <- simd_iz_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
simd_iz_housing  <- simd_iz_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
simd_iz_barriers <- simd_iz_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)

imd_scotland_iz <-
  simd_iz |>
  dplyr::left_join(simd_iz_income,   by = "iz_code") |>
  dplyr::left_join(simd_iz_employ,   by = "iz_code") |>
  dplyr::left_join(simd_iz_edu,      by = "iz_code") |>
  dplyr::left_join(simd_iz_health,   by = "iz_code") |>
  dplyr::left_join(simd_iz_crime,    by = "iz_code") |>
  dplyr::left_join(simd_iz_housing,  by = "iz_code") |>
  dplyr::left_join(simd_iz_barriers, by = "iz_code") |>

  # Don't have scores for Wales so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd_scotland_iz, overwrite = TRUE)
