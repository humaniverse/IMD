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
    lsoa_code = `LSOA Code`,
    population = `All Ages`
  ) |>
  dplyr::distinct()

lsoa_pop_wales <-
  lsoa_pop |>
  dplyr::filter(substr(lsoa_code, 1, 1) == "W")

# ---- Aggregate IMD into MSOAs ----
wimd_lsoa <-
  imd_wales_lsoa |>

  # We don't have IMD scores for Wales so just set them as zero
  dplyr::mutate(
    IMD_score = 0,
    Income_score = 0,
    Employment_score = 0,
    Education_score = 0,
    Health_score = 0,
    Crime_score = 0,
    Housing_score = 0,
    Access_score = 0,
    Environment_score = 0
  ) |>

  dplyr::left_join(lsoa_pop, by = "lsoa_code") |>
  dplyr::left_join(lsoa_ward, by = "lsoa_code")

# Aggregate into wards
wimd_ward <-
  wimd_lsoa |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, ward_code, population)

wimd_ward_income   <- wimd_lsoa |> aggregate_scores(Income_score, Income_rank, Income_decile, ward_code, population)
wimd_ward_employ   <- wimd_lsoa |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, ward_code, population)
wimd_ward_edu      <- wimd_lsoa |> aggregate_scores(Education_score, Education_rank, Education_decile, ward_code, population)
wimd_ward_health   <- wimd_lsoa |> aggregate_scores(Health_score, Health_rank, Health_decile, ward_code, population)
wimd_ward_crime    <- wimd_lsoa |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, ward_code, population)
wimd_ward_housing  <- wimd_lsoa |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, ward_code, population)
wimd_ward_barriers <- wimd_lsoa |> aggregate_scores(Access_score, Access_rank, Access_decile, ward_code, population)
wimd_ward_env      <- wimd_lsoa |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, ward_code, population)

wimd_ward_income   <- wimd_ward_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
wimd_ward_employ   <- wimd_ward_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
wimd_ward_edu      <- wimd_ward_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
wimd_ward_health   <- wimd_ward_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
wimd_ward_crime    <- wimd_ward_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
wimd_ward_housing  <- wimd_ward_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
wimd_ward_barriers <- wimd_ward_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)
wimd_ward_env      <- wimd_ward_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

imd_wales_ward <-
  wimd_ward |>
  dplyr::left_join(wimd_ward_income,   by = "ward_code") |>
  dplyr::left_join(wimd_ward_employ,   by = "ward_code") |>
  dplyr::left_join(wimd_ward_edu,      by = "ward_code") |>
  dplyr::left_join(wimd_ward_health,   by = "ward_code") |>
  dplyr::left_join(wimd_ward_crime,    by = "ward_code") |>
  dplyr::left_join(wimd_ward_housing,  by = "ward_code") |>
  dplyr::left_join(wimd_ward_barriers, by = "ward_code") |>
  dplyr::left_join(wimd_ward_env,      by = "ward_code") |>

  # Don't have scores for Wales so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd_wales_ward, overwrite = TRUE)
readr::write_csv(imd_wales_ward, "data-raw/imd_wales_ward.csv")
