# Load package
devtools::load_all(".")

# ---- LSOA to LAD lookup ----
# First create LSOA to MSOA lookup
query_url <-
  query_urls |>
  dplyr::filter(data_set == "lsoa_msoa_lad") |>
  dplyr::pull(query_url)

lsoa_msoa <-
  readr::read_csv(query_url)

lsoa_msoa <-
  lsoa_msoa |>
  dplyr::distinct(
    lsoa_code = LSOA11CD,
    msoa_code = MSOA11CD
  )

# Then make MSOA to LAD lookup
query_url <-
  query_urls |>
  dplyr::filter(data_set == "msoa_lad") |>
  dplyr::pull(query_url)

msoa_lad <-
  sf::read_sf(query_url)

# Select and rename vars
msoa_lad <-
  msoa_lad |>
  dplyr::select(
    msoa_code = MSOA11CD,
    lad_code = LAD19CD
  )

# And combine them
lsoa_lad <-
  lsoa_msoa |>
  dplyr::left_join(msoa_lad, by = "msoa_code") |>
  dplyr::select(-msoa_code)

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
  dplyr::left_join(lsoa_lad, by = "lsoa_code")

# Aggregate into LADs
wimd_lad <-
  wimd_lsoa |> aggregate_scores(IMD_score, IMD_rank, IMD_decile, lad_code, population)

wimd_lad_income   <- wimd_lsoa |> aggregate_scores(Income_score, Income_rank, Income_decile, lad_code, population)
wimd_lad_employ   <- wimd_lsoa |> aggregate_scores(Employment_score, Employment_rank, Employment_decile, lad_code, population)
wimd_lad_edu      <- wimd_lsoa |> aggregate_scores(Education_score, Education_rank, Education_decile, lad_code, population)
wimd_lad_health   <- wimd_lsoa |> aggregate_scores(Health_score, Health_rank, Health_decile, lad_code, population)
wimd_lad_crime    <- wimd_lsoa |> aggregate_scores(Crime_score, Crime_rank, Crime_decile, lad_code, population)
wimd_lad_housing  <- wimd_lsoa |> aggregate_scores(Housing_score, Housing_rank, Housing_decile, lad_code, population)
wimd_lad_barriers <- wimd_lsoa |> aggregate_scores(Access_score, Access_rank, Access_decile, lad_code, population)
wimd_lad_env      <- wimd_lsoa |> aggregate_scores(Environment_score, Environment_rank, Environment_decile, lad_code, population)

wimd_lad_income   <- wimd_lad_income   |> dplyr::rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
wimd_lad_employ   <- wimd_lad_employ   |> dplyr::rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
wimd_lad_edu      <- wimd_lad_edu      |> dplyr::rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
wimd_lad_health   <- wimd_lad_health   |> dplyr::rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
wimd_lad_crime    <- wimd_lad_crime    |> dplyr::rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
wimd_lad_housing  <- wimd_lad_housing  |> dplyr::rename(Housing_Proportion = Proportion, Housing_Extent = Extent, Housing_Score = Score)
wimd_lad_barriers <- wimd_lad_barriers |> dplyr::rename(Access_Proportion = Proportion, Access_Extent = Extent, Access_Score = Score)
wimd_lad_env      <- wimd_lad_env      |> dplyr::rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

imd_wales_lad <-
  wimd_lad |>
  dplyr::left_join(wimd_lad_income,   by = "lad_code") |>
  dplyr::left_join(wimd_lad_employ,   by = "lad_code") |>
  dplyr::left_join(wimd_lad_edu,      by = "lad_code") |>
  dplyr::left_join(wimd_lad_health,   by = "lad_code") |>
  dplyr::left_join(wimd_lad_crime,    by = "lad_code") |>
  dplyr::left_join(wimd_lad_housing,  by = "lad_code") |>
  dplyr::left_join(wimd_lad_barriers, by = "lad_code") |>
  dplyr::left_join(wimd_lad_env,      by = "lad_code") |>

  # Don't have scores for Wales so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Save output to data/ folder
usethis::use_data(imd_wales_lad, overwrite = TRUE)
