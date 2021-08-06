# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_dz_scotland") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xlsx"))
)

imd_scotland_dz <-
  readxl::read_excel(tf, sheet = "SIMD 2020v2 ranks")

imd_scotland_dz <-
  imd_scotland_dz |>

  dplyr::mutate(
    IMD_decile = as.integer(Hmisc::cut2(SIMD2020v2_Rank, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(SIMD2020v2_Income_Domain_Rank, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(SIMD2020_Employment_Domain_Rank, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(SIMD2020_Health_Domain_Rank, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(SIMD2020_Education_Domain_Rank, g = 10)),
    Housing_decile = as.integer(Hmisc::cut2(SIMD2020_Housing_Domain_Rank, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(SIMD2020_Access_Domain_Rank, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(SIMD2020_Crime_Domain_Rank, g = 10))
  ) |>

  dplyr::select(
    dz_code = Data_Zone,

    dplyr::ends_with("_decile"),

    IMD_rank = SIMD2020v2_Rank,
    Income_rank = SIMD2020v2_Income_Domain_Rank,
    Employment_rank = SIMD2020_Employment_Domain_Rank,
    Health_rank = SIMD2020_Health_Domain_Rank,
    Education_rank = SIMD2020_Education_Domain_Rank,
    Housing_rank = SIMD2020_Housing_Domain_Rank,
    Access_rank = SIMD2020_Access_Domain_Rank,
    Crime_rank = SIMD2020_Crime_Domain_Rank
  )

# Save output to data/ folder
usethis::use_data(imd_scotland_dz, overwrite = TRUE)
