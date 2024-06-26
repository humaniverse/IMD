library(compositr)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd2011_lsoa_wales") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

imd2011_wales_lsoa_raw <-
  readxl::read_excel(tf, sheet = "WIMD 2011 scores")

imd2011_wales_lsoa <-
  imd2011_wales_lsoa_raw |>

  # Remove final column which is `NA`
  #dplyr::select(-ncol(imd_wales_lsoa)) |>
  tibble::as_tibble() |>

  dplyr::mutate(
    IMD_rank = compositr::invert_rank(`WIMD 2011 score`),
    Income_rank = compositr::invert_rank(`Income 2011 score`),
    Employment_rank = compositr::invert_rank(`Employment 2011 score`),
    Health_rank = compositr::invert_rank(`Health 2011 score`),
    Education_rank = compositr::invert_rank(`Education 2011 score`),
    Housing_rank = compositr::invert_rank(`Housing 2011 score`),
    Access_rank = compositr::invert_rank(`Access 2011 score`),
    Environment_rank = compositr::invert_rank(`Enviroment 2011 score`),
    Crime_rank = compositr::invert_rank(`Community Safety 2011 score`)
  ) |>

  dplyr::mutate(
    IMD_decile = as.integer(Hmisc::cut2(IMD_rank, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(Income_rank, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(Employment_rank, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(Health_rank, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(Education_rank, g = 10)),
    Housing_decile = as.integer(Hmisc::cut2(Housing_rank, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(Access_rank, g = 10)),
    Environment_decile = as.integer(Hmisc::cut2(Environment_rank, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(Crime_rank, g = 10))
  ) |>

  dplyr::select(
    lsoa_code = `LSOA Code`,
    dplyr::ends_with("_rank"),
    dplyr::ends_with("_decile")
  )

# Save output to data/ folder
usethis::use_data(imd2011_wales_lsoa, overwrite = TRUE)
readr::write_csv(imd2011_wales_lsoa, "data-raw/imd2011_wales_lsoa.csv")
