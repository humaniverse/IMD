# Load package
devtools::load_all(".")

# ---- LSOA to LAD lookup ----
lookup_lsoa11_ltla23 <-
  geographr::lookup_lsoa11_ltla21 |>
  select(lsoa11_code, ltla22_code = ltla21_code) |>
  left_join(
    lookup_ltla22_ltla23 |> select(ltla22_code, ltla23_code)
  ) |>
  select(-ltla22_code)

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
    lsoa11_code = `LSOA code (2011)`,
    population = `Total population: mid 2015 (excluding prisoners)`
  )

# ---- Aggregate IMD subdomains into MSOAs ----
eimd <-
  imd2019_england_lsoa11_subdomains |>

  dplyr::select(
    lsoa11_code,
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

  dplyr::left_join(lookup_lsoa11_ltla23, by = "lsoa11_code") |>
  dplyr::left_join(pop_lsoa, by = "lsoa11_code")

# Aggregate into Local Authorities
eimd_lad_children <- eimd |> aggregate_scores(Score, Children_and_young_people_rank, Children_and_young_people_decile, ltla23_code, population)
eimd_lad_adult    <- eimd |> aggregate_scores(Score, Adult_skills_rank, Adult_skills_decile, ltla23_code, population)
eimd_lad_geo      <- eimd |> aggregate_scores(Score, Geographical_barriers_rank, Geographical_barriers_decile, ltla23_code, population)
eimd_lad_wider    <- eimd |> aggregate_scores(Score, Wider_barriers_rank, Wider_barriers_decile, ltla23_code, population)
eimd_lad_in       <- eimd |> aggregate_scores(Score, Indoors_rank, Indoors_decile, ltla23_code, population)
eimd_lad_out      <- eimd |> aggregate_scores(Score, Outdoors_rank, Outdoors_decile, ltla23_code, population)

eimd_lad_children <- eimd_lad_children |> dplyr::rename(Children_and_young_people_Proportion = Proportion, Children_and_young_people_Extent = Extent, Children_and_young_people_Score = Score)
eimd_lad_adult    <- eimd_lad_adult    |> dplyr::rename(Adult_skills_Proportion = Proportion, Adult_skills_Extent = Extent, Adult_skills_Score = Score)
eimd_lad_geo      <- eimd_lad_geo      |> dplyr::rename(Geographical_barriers_Proportion = Proportion, Geographical_barriers_Extent = Extent, Geographical_barriers_Score = Score)
eimd_lad_wider    <- eimd_lad_wider    |> dplyr::rename(Wider_barriers_Proportion = Proportion, Wider_barriers_Extent = Extent, Wider_barriers_Score = Score)
eimd_lad_in       <- eimd_lad_in       |> dplyr::rename(Indoors_Proportion = Proportion, Indoors_Extent = Extent, Indoors_Score = Score)
eimd_lad_out      <- eimd_lad_out      |> dplyr::rename(Outdoors_Proportion = Proportion, Outdoors_Extent = Extent, Outdoors_Score = Score)

eimd_lad <-
  eimd_lad_children  |>
  dplyr::left_join(eimd_lad_adult, by = "ltla23_code") |>
  dplyr::left_join(eimd_lad_geo,   by = "ltla23_code") |>
  dplyr::left_join(eimd_lad_wider, by = "ltla23_code") |>
  dplyr::left_join(eimd_lad_in,    by = "ltla23_code") |>
  dplyr::left_join(eimd_lad_out,   by = "ltla23_code") |>

  # Don't have scores for sub-domains so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Rename
imd2019_england_ltla23_subdomains <- eimd_lad

# Save output to data/ folder
usethis::use_data(imd2019_england_ltla23_subdomains, overwrite = TRUE)
