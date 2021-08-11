# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_lsoa_england") |>
  dplyr::pull(query_url)

imd_england_lsoa <-
  readr::read_csv(query_url)

imd_england_lsoa <-
  imd_england_lsoa |>
  dplyr::select(
    lsoa_code = `LSOA code (2011)`,

    IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`,
    Income_decile = `Income Decile (where 1 is most deprived 10% of LSOAs)`,
    Employment_decile = `Employment Decile (where 1 is most deprived 10% of LSOAs)`,
    Education_decile = `Education, Skills and Training Decile (where 1 is most deprived 10% of LSOAs)`,
    Health_decile = `Health Deprivation and Disability Decile (where 1 is most deprived 10% of LSOAs)`,
    Crime_decile = `Crime Decile (where 1 is most deprived 10% of LSOAs)`,
    Housing_and_Access_decile = `Barriers to Housing and Services Decile (where 1 is most deprived 10% of LSOAs)`,
    Environment_decile = `Living Environment Decile (where 1 is most deprived 10% of LSOAs)`,

    IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`,
    Income_rank = `Income Rank (where 1 is most deprived)`,
    Employment_rank = `Employment Rank (where 1 is most deprived)`,
    Education_rank = `Education, Skills and Training Rank (where 1 is most deprived)`,
    Health_rank = `Health Deprivation and Disability Rank (where 1 is most deprived)`,
    Crime_rank = `Crime Rank (where 1 is most deprived)`,
    Housing_and_Access_rank = `Barriers to Housing and Services Rank (where 1 is most deprived)`,
    Environment_rank = `Living Environment Rank (where 1 is most deprived)`
  )

# Save output to data/ folder
usethis::use_data(imd_england_lsoa, overwrite = TRUE)
readr::write_csv(imd_england_lsoa, "data-raw/imd_england_lsoa.csv")
