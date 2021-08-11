# Load package
devtools::load_all(".")

# ---- Super Output Area to LAD lookup ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "sa_soa_lgd") |>
  dplyr::pull(query_url)

soa_lad <-
  readr::read_csv(query_url)

# Select and rename vars
soa_lad <-
  soa_lad |>
  dplyr::select(
    soa_code = LSOA11CD,
    lad_code = LAD18CD
  ) |>
  dplyr::distinct()

# ---- Population estimates in SOAs ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "pop_soa") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xlsx"))
)

soa_pop <-
  readxl::read_excel(tf, sheet = "Flat")

# Select and rename vars
soa_pop <-
  soa_pop |>

  dplyr::filter(area == "1. Super Output Areas" & year == "2019" & gender == "All persons") |>
  tidyr::pivot_wider(names_from = age, values_from = MYE) |>

  dplyr::select(
    soa_code = area_code,
    population = `All ages`
  ) |>

  dplyr::distinct()

# ---- Aggregate IMD into LADs ----
niimd_soa <-
  imd_northern_ireland_soa |>

  # We don't have IMD scores for NI so just set them as zero
  dplyr::mutate(
    IMD_score = 0,
    Income_score = 0,
    Employment_score = 0,
    Education_score = 0,
    Health_score = 0,
    Crime_score = 0,
    Access_score = 0,
    Environment_score = 0
  ) |>

  dplyr::left_join(soa_pop, by = "soa_code") |>
  dplyr::left_join(soa_lad, by = "soa_code")

# Aggregate into LADs
niimd_lad <-
  niimd_soa |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, lad_code, population)

niimd_lad_income   <- niimd_soa |> aggregate_scores(Income_score, Income_rank, Income_decile, lad_code, population)
niimd_lad_employ   <- niimd_soa |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, lad_code, population)
niimd_lad_edu      <- niimd_soa |> aggregate_scores(Education_score, Education_rank, Education_decile, lad_code, population)
niimd_lad_health   <- niimd_soa |> aggregate_scores(Health_score, Health_rank, Health_decile, lad_code, population)
niimd_lad_crime    <- niimd_soa |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, lad_code, population)
niimd_lad_barriers <- niimd_soa |> aggregate_scores(Access_score, Access_rank, Access_decile, lad_code, population)
niimd_lad_env      <- niimd_soa |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, lad_code, population)

niimd_lad_income   <- niimd_lad_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
niimd_lad_employ   <- niimd_lad_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
niimd_lad_edu      <- niimd_lad_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
niimd_lad_health   <- niimd_lad_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
niimd_lad_crime    <- niimd_lad_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
niimd_lad_barriers <- niimd_lad_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)
niimd_lad_env      <- niimd_lad_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_score = Score)

imd_northern_ireland_lad <-
  niimd_lad |>
  dplyr::left_join(niimd_lad_income,   by = "lad_code") |>
  dplyr::left_join(niimd_lad_employ,   by = "lad_code") |>
  dplyr::left_join(niimd_lad_edu,      by = "lad_code") |>
  dplyr::left_join(niimd_lad_health,   by = "lad_code") |>
  dplyr::left_join(niimd_lad_crime,    by = "lad_code") |>
  dplyr::left_join(niimd_lad_barriers, by = "lad_code") |>
  dplyr::left_join(niimd_lad_env,      by = "lad_code") |>

  # Don't have scores for NI so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd_northern_ireland_lad, overwrite = TRUE)
readr::write_csv(imd_northern_ireland_lad, "data-raw/imd_northern_ireland_lad.csv")
