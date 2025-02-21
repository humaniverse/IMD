# Load package
devtools::load_all(".")

query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_lad_england") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xlsx"))
)

# ---- IMD ----
imd_overall <-
  readxl::read_excel(tf, sheet = "IMD")

imd_overall <-
  imd_overall |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Score = `IMD - Average score`,
    Proportion = `IMD - Proportion of LSOAs in most deprived 10% nationally`,
    Extent = `IMD 2019 - Extent`
  )

# ---- Income ----
income <-
  readxl::read_excel(tf, sheet = "Income")

income <-
  income |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Income_Score = `Income - Average score`,
    Income_Proportion = `Income - Proportion of LSOAs in most deprived 10% nationally`
  )

# ---- Employment ----
employment <-
  readxl::read_excel(tf, sheet = "Employment")

employment <-
  employment |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Employment_Score = `Employment - Average score`,
    Employment_Proportion = `Employment - Proportion of LSOAs in most deprived 10% nationally`
  )

# ---- Education ----
education <-
  readxl::read_excel(tf, sheet = "Education")

education <-
  education |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Education_Score = `Education, Skills and Training - Average score`,
    Education_Proportion = `Education, Skills and Training - Proportion of LSOAs in most deprived 10% nationally`
  )

# ---- Health ----
health <-
  readxl::read_excel(tf, sheet = "Health")

health <-
  health |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Health_Score = `Health Deprivation and Disability - Average score`,
    Health_Proportion = `Health Deprivation and Disability - Proportion of LSOAs in most deprived 10% nationally`
  )

# ---- Crime ----
crime <-
  readxl::read_excel(tf, sheet = "Crime")

crime <-
  crime |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Crime_Score = `Crime - Average score`,
    Crime_Proportion = `Crime - Proportion of LSOAs in most deprived 10% nationally`
  )

# ---- Barriers ----
barriers <-
  readxl::read_excel(tf, sheet = "Barriers")

barriers <-
  barriers |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Housing_and_Access_Score = `Barriers to Housing and Services - Average score`,
    Housing_and_Access_Proportion = `Barriers to Housing and Services - Proportion of LSOAs in most deprived 10% nationally`
  )

# ---- Environment ----
env <-
  readxl::read_excel(tf, sheet = "Living")

env <-
  env |>
  dplyr::select(
    ltla19_code = `Local Authority District code (2019)`,

    Environment_Score = `Living Environment - Average score`,
    Environment_Proportion = `Living Environment - Proportion of LSOAs in most deprived 10% nationally`
  )

# ---- Combine ----
imd2019_england_ltla19 <-
  imd_overall |>
  dplyr::left_join(income, by = "ltla19_code") |>
  dplyr::left_join(employment, by = "ltla19_code") |>
  dplyr::left_join(education, by = "ltla19_code") |>
  dplyr::left_join(health, by = "ltla19_code") |>
  dplyr::left_join(crime, by = "ltla19_code") |>
  dplyr::left_join(barriers, by = "ltla19_code") |>
  dplyr::left_join(env, by = "ltla19_code")

# Save output to data/ folder
usethis::use_data(imd2019_england_ltla19, overwrite = TRUE)
