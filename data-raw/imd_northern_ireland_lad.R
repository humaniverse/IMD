# Load package
devtools::load_all(".")

# ---- Super Output Area to LAD lookup ----
lookup_soa01_lgd14 <-
  geographr::lookup_soa01_lgd14

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
    soa01_code = area_code,
    population = `All ages`
  ) |>

  dplyr::distinct()

# ---- Aggregate IMD into LADs ----
niimd_soa <-
  imd2017_northern_ireland_soa01 |>

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

  dplyr::left_join(soa_pop, by = "soa01_code") |>
  dplyr::left_join(lookup_soa01_lgd14, by = "soa01_code")

# Aggregate into LADs
niimd_lad <-
  niimd_soa |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, lgd14_code, population)

niimd_lgd14_income   <- niimd_soa |> aggregate_scores(Income_score, Income_rank, Income_decile, lgd14_code, population)
niimd_lgd14_employ   <- niimd_soa |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, lgd14_code, population)
niimd_lgd14_edu      <- niimd_soa |> aggregate_scores(Education_score, Education_rank, Education_decile, lgd14_code, population)
niimd_lgd14_health   <- niimd_soa |> aggregate_scores(Health_score, Health_rank, Health_decile, lgd14_code, population)
niimd_lgd14_crime    <- niimd_soa |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, lgd14_code, population)
niimd_lgd14_barriers <- niimd_soa |> aggregate_scores(Access_score, Access_rank, Access_decile, lgd14_code, population)
niimd_lgd14_env      <- niimd_soa |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, lgd14_code, population)

niimd_lgd14_income   <- niimd_lgd14_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
niimd_lgd14_employ   <- niimd_lgd14_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
niimd_lgd14_edu      <- niimd_lgd14_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
niimd_lgd14_health   <- niimd_lgd14_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
niimd_lgd14_crime    <- niimd_lgd14_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
niimd_lgd14_barriers <- niimd_lgd14_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)
niimd_lgd14_env      <- niimd_lgd14_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_score = Score)

imd2017_northern_ireland_lgd14 <-
  niimd_lad |>
  dplyr::left_join(niimd_lgd14_income,   by = "lgd14_code") |>
  dplyr::left_join(niimd_lgd14_employ,   by = "lgd14_code") |>
  dplyr::left_join(niimd_lgd14_edu,      by = "lgd14_code") |>
  dplyr::left_join(niimd_lgd14_health,   by = "lgd14_code") |>
  dplyr::left_join(niimd_lgd14_crime,    by = "lgd14_code") |>
  dplyr::left_join(niimd_lgd14_barriers, by = "lgd14_code") |>
  dplyr::left_join(niimd_lgd14_env,      by = "lgd14_code") |>

  # Don't have scores for NI so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd2017_northern_ireland_lgd14, overwrite = TRUE)
