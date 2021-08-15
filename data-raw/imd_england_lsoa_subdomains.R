# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_england_subdomains") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xlsx"))
)

imd_england_lsoa_subdomains <-
  readxl::read_excel(tf, sheet = "IoD2019 Sub-domains")

imd_england_lsoa_subdomains <-
  imd_england_lsoa_subdomains |>
  dplyr::select(
    lsoa_code = `LSOA code (2011)`,

    # Deciles
    Education_decile = `Education, Skills and Training Decile (where 1 is most deprived 10% of LSOAs)`,
    Children_and_young_people_decile = `Children and Young People Sub-domain Decile (where 1 is most deprived 10% of LSOAs)`,
    Adult_skills_decile = `Adult Skills Sub-domain Decile (where 1 is most deprived 10% of LSOAs)`,

    Housing_and_Access_decile = `Barriers to Housing and Services Decile (where 1 is most deprived 10% of LSOAs)`,
    Geographical_barriers_decile = `Geographical Barriers Sub-domain Decile (where 1 is most deprived 10% of LSOAs)`,
    Wider_barriers_decile = `Wider Barriers Sub-domain Decile (where 1 is most deprived 10% of LSOAs)`,

    Environment_decile = `Living Environment Decile (where 1 is most deprived 10% of LSOAs)`,
    Indoors_decile = `Indoors Sub-domain Decile (where 1 is most deprived 10% of LSOAs)`,
    Outdoors_decile = `Outdoors Sub-domain Decile (where 1 is most deprived 10% of LSOAs)`,

    # Ranks
    Education_rank = `Education, Skills and Training Rank (where 1 is most deprived)`,
    Children_and_young_people_rank = `Children and Young People Sub-domain Rank (where 1 is most deprived)`,
    Adult_skills_rank = `Adult Skills Sub-domain Rank (where 1 is most deprived)`,

    Housing_and_Access_rank = `Barriers to Housing and Services Rank (where 1 is most deprived)`,
    Geographical_barriers_rank = `Geographical Barriers Sub-domain Rank (where 1 is most deprived)`,
    Wider_barriers_rank = `Wider Barriers Sub-domain Rank (where 1 is most deprived)`,

    Environment_rank = `Living Environment Rank (where 1 is most deprived)`,
    Indoors_rank = `Indoors Sub-domain Rank (where 1 is most deprived)`,
    Outdoors_rank = `Outdoors Sub-domain Rank (where 1 is most deprived)`,

  )

# Save output to data/ folder
usethis::use_data(imd_england_lsoa_subdomains, overwrite = TRUE)
readr::write_csv(imd_england_lsoa_subdomains, "data-raw/imd_england_lsoa_subdomains.csv")
