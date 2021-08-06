# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_soa_ni") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

imd_northern_ireland_soa <-
  readxl::read_excel(tf, sheet = "MDM")

imd_northern_ireland_soa <-
  imd_northern_ireland_soa |>

  dplyr::mutate(
    IMD_decile = as.integer(Hmisc::cut2(`Multiple Deprivation Measure Rank \n(where 1 is most deprived)`, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(`Income Domain Rank \n(where 1 is most deprived)`, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(`Employment Domain Rank (where 1 is most deprived)`, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(`Health Deprivation and Disability Domain Rank (where 1 is most deprived)`, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(`Education, Skills and Training Domain Rank (where 1 is most deprived)`, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(`Access to Services Domain Rank (where 1 is most deprived)`, g = 10)),
    Environment_decile = as.integer(Hmisc::cut2(`Living Environment Domain Rank (where 1 is most deprived)`, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(`Crime and Disorder Domain Rank (where 1 is most deprived)`, g = 10))
  ) %>%

  dplyr::select(
    soa_code = SOA2001,

    dplyr::ends_with("_decile"),

    IMD_rank = `Multiple Deprivation Measure Rank \n(where 1 is most deprived)`,
    Income_rank = `Income Domain Rank \n(where 1 is most deprived)`,
    Employment_rank = `Employment Domain Rank (where 1 is most deprived)`,
    Health_rank = `Health Deprivation and Disability Domain Rank (where 1 is most deprived)`,
    Education_rank = `Education, Skills and Training Domain Rank (where 1 is most deprived)`,
    Access_rank = `Access to Services Domain Rank (where 1 is most deprived)`,
    Environment_rank = `Living Environment Domain Rank (where 1 is most deprived)`,
    Crime_rank = `Crime and Disorder Domain Rank (where 1 is most deprived)`
  )

# Save output to data/ folder
usethis::use_data(imd_northern_ireland_soa, overwrite = TRUE)
