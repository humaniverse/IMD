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

  dplyr::left_join(lsoa_lad, by = "lsoa_code") |>
  dplyr::left_join(pop_lsoa, by = "lsoa_code")

# Aggregate into Local Authorities
eimd_lad_children <- eimd |> aggregate_scores(Score, Children_and_young_people_rank, Children_and_young_people_decile, lad_code, population)
eimd_lad_adult    <- eimd |> aggregate_scores(Score, Adult_skills_rank, Adult_skills_decile, lad_code, population)
eimd_lad_geo      <- eimd |> aggregate_scores(Score, Geographical_barriers_rank, Geographical_barriers_decile, lad_code, population)
eimd_lad_wider    <- eimd |> aggregate_scores(Score, Wider_barriers_rank, Wider_barriers_decile, lad_code, population)
eimd_lad_in       <- eimd |> aggregate_scores(Score, Indoors_rank, Indoors_decile, lad_code, population)
eimd_lad_out      <- eimd |> aggregate_scores(Score, Outdoors_rank, Outdoors_decile, lad_code, population)

eimd_lad_children <- eimd_lad_children |> dplyr::rename(Children_and_young_people_Proportion = Proportion, Children_and_young_people_Extent = Extent, Children_and_young_people_Score = Score)
eimd_lad_adult    <- eimd_lad_adult    |> dplyr::rename(Adult_skills_Proportion = Proportion, Adult_skills_Extent = Extent, Adult_skills_Score = Score)
eimd_lad_geo      <- eimd_lad_geo      |> dplyr::rename(Geographical_barriers_Proportion = Proportion, Geographical_barriers_Extent = Extent, Geographical_barriers_Score = Score)
eimd_lad_wider    <- eimd_lad_wider    |> dplyr::rename(Wider_barriers_Proportion = Proportion, Wider_barriers_Extent = Extent, Wider_barriers_Score = Score)
eimd_lad_in       <- eimd_lad_in       |> dplyr::rename(Indoors_Proportion = Proportion, Indoors_Extent = Extent, Indoors_Score = Score)
eimd_lad_out      <- eimd_lad_out      |> dplyr::rename(Outdoors_Proportion = Proportion, Outdoors_Extent = Extent, Outdoors_Score = Score)

eimd_lad <-
  eimd_lad_children  |>
  dplyr::left_join(eimd_lad_adult, by = "lad_code") |>
  dplyr::left_join(eimd_lad_geo,   by = "lad_code") |>
  dplyr::left_join(eimd_lad_wider, by = "lad_code") |>
  dplyr::left_join(eimd_lad_in,    by = "lad_code") |>
  dplyr::left_join(eimd_lad_out,   by = "lad_code") |>

  # Don't have scores for sub-domains so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Rename
imd_england_lad_subdomains <- eimd_lad

# Save output to data/ folder
usethis::use_data(imd_england_lad_subdomains, overwrite = TRUE)
readr::write_csv(imd_england_lad_subdomains, "data-raw/imd_england_lad_subdomains.csv")
