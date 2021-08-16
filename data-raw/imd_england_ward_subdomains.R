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

# ---- Load LSOA populations from original IMD data ----
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd_lsoa_england") |>
  dplyr::pull(query_url)

pop_lsoa <-
  readr::read_csv(query_url)

pop_lsoa <-
  pop_lsoa |>
  dplyr::select(
    lsoa_code = `LSOA code (2011)`,
    population = `Total population: mid 2015 (excluding prisoners)`
  )

# ---- Aggregate IMD subdomains into MSOAs ----
eimd <-
  imd_england_lsoa_subdomains |>

  dplyr::select(
    lsoa_code,
    dplyr::starts_with("Children"),
    dplyr::starts_with("Adult"),
    dplyr::starts_with("Geog"),
    dplyr::starts_with("Wider"),
    dplyr::starts_with("Indoors"),
    dplyr::starts_with("Outdoors")
  ) |>

  # We don't have scores for these sub-domains so just set them as zero
  dplyr::mutate(
    Score = 0
  ) |>

  dplyr::left_join(lsoa_ward, by = "lsoa_code") |>
  dplyr::left_join(pop_lsoa, by = "lsoa_code")

# Aggregate into wards
eimd_ward_children <- eimd |> aggregate_scores(Score, Children_and_young_people_rank, Children_and_young_people_decile, ward_code, population)
eimd_ward_adult    <- eimd |> aggregate_scores(Score, Adult_skills_rank, Adult_skills_decile, ward_code, population)
eimd_ward_geo      <- eimd |> aggregate_scores(Score, Geographical_barriers_rank, Geographical_barriers_decile, ward_code, population)
eimd_ward_wider    <- eimd |> aggregate_scores(Score, Wider_barriers_rank, Wider_barriers_decile, ward_code, population)
eimd_ward_in       <- eimd |> aggregate_scores(Score, Indoors_rank, Indoors_decile, ward_code, population)
eimd_ward_out      <- eimd |> aggregate_scores(Score, Outdoors_rank, Outdoors_decile, ward_code, population)

eimd_ward_children <- eimd_ward_children |> dplyr::rename(Children_and_young_people_Proportion = Proportion, Children_and_young_people_Extent = Extent, Children_and_young_people_Score = Score)
eimd_ward_adult    <- eimd_ward_adult    |> dplyr::rename(Adult_skills_Proportion = Proportion, Adult_skills_Extent = Extent, Adult_skills_Score = Score)
eimd_ward_geo      <- eimd_ward_geo      |> dplyr::rename(Geographical_barriers_Proportion = Proportion, Geographical_barriers_Extent = Extent, Geographical_barriers_Score = Score)
eimd_ward_wider    <- eimd_ward_wider    |> dplyr::rename(Wider_barriers_Proportion = Proportion, Wider_barriers_Extent = Extent, Wider_barriers_Score = Score)
eimd_ward_in       <- eimd_ward_in       |> dplyr::rename(Indoors_Proportion = Proportion, Indoors_Extent = Extent, Indoors_Score = Score)
eimd_ward_out      <- eimd_ward_out      |> dplyr::rename(Outdoors_Proportion = Proportion, Outdoors_Extent = Extent, Outdoors_Score = Score)

eimd_ward <-
  eimd_ward_children  |>
  dplyr::left_join(eimd_ward_adult, by = "ward_code") |>
  dplyr::left_join(eimd_ward_geo,   by = "ward_code") |>
  dplyr::left_join(eimd_ward_wider, by = "ward_code") |>
  dplyr::left_join(eimd_ward_in,    by = "ward_code") |>
  dplyr::left_join(eimd_ward_out,   by = "ward_code") |>

  # Don't have scores for sub-domains so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Rename
imd_england_ward_subdomains <- eimd_ward

# Save output to data/ folder
usethis::use_data(imd_england_ward_subdomains, overwrite = TRUE)
readr::write_csv(imd_england_ward_subdomains, "data-raw/imd_england_ward_subdomains.csv")
