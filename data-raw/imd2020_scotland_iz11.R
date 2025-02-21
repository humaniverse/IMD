# Load package
devtools::load_all(".")

# ---- Data Zone to Intermediate Zone lookup ----
dz_iz <-
  geographr::lookup_dz11_iz11_ltla20 |>
  select(dz11_code, iz11_code)

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
    dz11_code = DataZone,
    population = AllAges
  )

# ---- Aggregate IMD into Intermediate Zones ----
simd_dz <-
  imd2020_scotland_dz11 |>

  # We don't have IMD scores for Scotland so just set them as zero
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

  dplyr::left_join(dz_pop, by = "dz11_code") |>
  dplyr::left_join(dz_iz, by = "dz11_code")

# Aggregate into IZs
simd_iz <-
  simd_dz |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, iz11_code, population)

simd_iz_income   <- simd_dz |> aggregate_scores(Income_score, Income_rank, Income_decile, iz11_code, population)
simd_iz_employ   <- simd_dz |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, iz11_code, population)
simd_iz_edu      <- simd_dz |> aggregate_scores(Education_score, Education_rank, Education_decile, iz11_code, population)
simd_iz_health   <- simd_dz |> aggregate_scores(Health_score, Health_rank, Health_decile, iz11_code, population)
simd_iz_crime    <- simd_dz |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, iz11_code, population)
simd_iz_housing  <- simd_dz |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, iz11_code, population)
simd_iz_barriers <- simd_dz |> aggregate_scores(Access_score, Access_rank, Access_decile, iz11_code, population)

simd_iz_income   <- simd_iz_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
simd_iz_employ   <- simd_iz_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
simd_iz_edu      <- simd_iz_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
simd_iz_health   <- simd_iz_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
simd_iz_crime    <- simd_iz_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
simd_iz_housing  <- simd_iz_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
simd_iz_barriers <- simd_iz_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)

imd2020_scotland_iz11 <-
  simd_iz |>
  dplyr::left_join(simd_iz_income,   by = "iz11_code") |>
  dplyr::left_join(simd_iz_employ,   by = "iz11_code") |>
  dplyr::left_join(simd_iz_edu,      by = "iz11_code") |>
  dplyr::left_join(simd_iz_health,   by = "iz11_code") |>
  dplyr::left_join(simd_iz_crime,    by = "iz11_code") |>
  dplyr::left_join(simd_iz_housing,  by = "iz11_code") |>
  dplyr::left_join(simd_iz_barriers, by = "iz11_code") |>

  # Don't have scores for Scotland so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd2020_scotland_iz11, overwrite = TRUE)
