library(geographr)

# Load package
devtools::load_all(".")

# ---- LSOA to MSOA lookup ----
lsoa_msoa <-
  lookup_lsoa11_msoa11 |>
  select(lsoa11_code, msoa11_code)

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

  dplyr::left_join(lsoa_msoa, by = "lsoa11_code") |>
  dplyr::left_join(pop_lsoa, by = "lsoa11_code")

# Aggregate into MSOAs
eimd_msoa_children <- eimd |> aggregate_scores(Score, Children_and_young_people_rank, Children_and_young_people_decile, msoa11_code, population)
eimd_msoa_adult    <- eimd |> aggregate_scores(Score, Adult_skills_rank, Adult_skills_decile, msoa11_code, population)
eimd_msoa_geo      <- eimd |> aggregate_scores(Score, Geographical_barriers_rank, Geographical_barriers_decile, msoa11_code, population)
eimd_msoa_wider    <- eimd |> aggregate_scores(Score, Wider_barriers_rank, Wider_barriers_decile, msoa11_code, population)
eimd_msoa_in       <- eimd |> aggregate_scores(Score, Indoors_rank, Indoors_decile, msoa11_code, population)
eimd_msoa_out      <- eimd |> aggregate_scores(Score, Outdoors_rank, Outdoors_decile, msoa11_code, population)

eimd_msoa_children <- eimd_msoa_children |> dplyr::rename(Children_and_young_people_Proportion = Proportion, Children_and_young_people_Extent = Extent, Children_and_young_people_Score = Score)
eimd_msoa_adult    <- eimd_msoa_adult    |> dplyr::rename(Adult_skills_Proportion = Proportion, Adult_skills_Extent = Extent, Adult_skills_Score = Score)
eimd_msoa_geo      <- eimd_msoa_geo      |> dplyr::rename(Geographical_barriers_Proportion = Proportion, Geographical_barriers_Extent = Extent, Geographical_barriers_Score = Score)
eimd_msoa_wider    <- eimd_msoa_wider    |> dplyr::rename(Wider_barriers_Proportion = Proportion, Wider_barriers_Extent = Extent, Wider_barriers_Score = Score)
eimd_msoa_in       <- eimd_msoa_in       |> dplyr::rename(Indoors_Proportion = Proportion, Indoors_Extent = Extent, Indoors_Score = Score)
eimd_msoa_out      <- eimd_msoa_out      |> dplyr::rename(Outdoors_Proportion = Proportion, Outdoors_Extent = Extent, Outdoors_Score = Score)

eimd_msoa <-
  eimd_msoa_children  |>
  dplyr::left_join(eimd_msoa_adult, by = "msoa11_code") |>
  dplyr::left_join(eimd_msoa_geo,   by = "msoa11_code") |>
  dplyr::left_join(eimd_msoa_wider, by = "msoa11_code") |>
  dplyr::left_join(eimd_msoa_in,    by = "msoa11_code") |>
  dplyr::left_join(eimd_msoa_out,   by = "msoa11_code") |>

  # Don't have scores for sub-domains so drop these columns
  dplyr::select(-dplyr::ends_with("Score"))

# Rename
imd2019_england_msoa11_subdomains <- eimd_msoa

# Save output to data/ folder
usethis::use_data(imd2019_england_msoa11_subdomains, overwrite = TRUE)
