# Load package
devtools::load_all(".")

# ---- Data Zones to LAD lookup ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "dz_iz_lad") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xlsx"))
)

dz_lad <-
  readxl::read_excel(tf, sheet = "SIMD 2020v2 DZ lookup data")

dz_lad <-
  dz_lad |>
  dplyr::distinct(
    dz_code = DZ,
    lad_code = LAcode
  )

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

# ---- Aggregate IMD into LADs ----
simd_dz <-
  imd_scotland_dz |>

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

  dplyr::left_join(dz_pop, by = "dz_code") |>
  dplyr::left_join(dz_lad, by = "dz_code")

# Aggregate into MSOAs
simd_lad <-
  simd_dz |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, lad_code, population)

simd_lad_income   <- simd_dz |> aggregate_scores(Income_score, Income_rank, Income_decile, lad_code, population)
simd_lad_employ   <- simd_dz |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, lad_code, population)
simd_lad_edu      <- simd_dz |> aggregate_scores(Education_score, Education_rank, Education_decile, lad_code, population)
simd_lad_health   <- simd_dz |> aggregate_scores(Health_score, Health_rank, Health_decile, lad_code, population)
simd_lad_crime    <- simd_dz |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, lad_code, population)
simd_lad_housing  <- simd_dz |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, lad_code, population)
simd_lad_barriers <- simd_dz |> aggregate_scores(Access_score, Access_rank, Access_decile, lad_code, population)

simd_lad_income   <- simd_lad_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
simd_lad_employ   <- simd_lad_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
simd_lad_edu      <- simd_lad_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
simd_lad_health   <- simd_lad_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
simd_lad_crime    <- simd_lad_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
simd_lad_housing  <- simd_lad_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
simd_lad_barriers <- simd_lad_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)

imd_scotland_lad <-
  simd_lad |>
  dplyr::left_join(simd_lad_income,   by = "lad_code") |>
  dplyr::left_join(simd_lad_employ,   by = "lad_code") |>
  dplyr::left_join(simd_lad_edu,      by = "lad_code") |>
  dplyr::left_join(simd_lad_health,   by = "lad_code") |>
  dplyr::left_join(simd_lad_crime,    by = "lad_code") |>
  dplyr::left_join(simd_lad_housing,  by = "lad_code") |>
  dplyr::left_join(simd_lad_barriers, by = "lad_code") |>

  # Don't have scores for Wales so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd_scotland_lad, overwrite = TRUE)
