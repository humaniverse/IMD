# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd2016_dz_scotland") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xlsx"))
)

imd2016_scotland_dz_raw <-
  readxl::read_excel(tf, sheet = 2)

imd2016_scotland_dz11 <-
  imd2016_scotland_dz_raw |>

  dplyr::mutate(
    IMD_decile = as.integer(Hmisc::cut2(Overall_SIMD16_rank, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(Income_domain_2016_rank, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(Employment_domain_2016_rank, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(Health_domain_2016_rank, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(Education_domain_2016_rank, g = 10)),
    Housing_decile = as.integer(Hmisc::cut2(Housing_domain_2016_rank, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(Access_domain_2016_rank, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(Crime_domain_2016_rank, g = 10))
  ) |>

  dplyr::select(
    dz11_code = Data_Zone,

    dplyr::ends_with("_decile"),

    IMD_rank = Overall_SIMD16_rank,
    Income_rank = Income_domain_2016_rank,
    Employment_rank = Employment_domain_2016_rank,
    Health_rank = Health_domain_2016_rank,
    Education_rank = Education_domain_2016_rank,
    Housing_rank = Housing_domain_2016_rank,
    Access_rank = Access_domain_2016_rank,
    Crime_rank = Crime_domain_2016_rank
  )

# Save output to data/ folder
usethis::use_data(imd2016_scotland_dz11, overwrite = TRUE)
