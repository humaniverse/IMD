library(tidyverse)
library(devtools)
library(readxl)
library(httr)

load_all(".")

# ---- Fetch population denominators ----
# Set query url
query_url <-
  query_urls |>
  filter(data_set == "pop15_lsoa") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

pop_2015 <- read_excel(tf, sheet = "Population Denominators")

pop_2015 <-
  pop_2015 |>
  select(
    lsoa11_code = `LSOA code (2011)`,
    total_population = `Total population: mid 2012 (excluding prisoners)`
  )

# ---- Calculate MSOA-level IMD for 2015 ----
imd_lsoa <-
  imd2015_lsoa11_england |>

  # We don't have IMD scores for Wales so just set them as zero
  dplyr::mutate(
    IMD_score = 0
  ) |>

  dplyr::left_join(pop_2015, by = "lsoa11_code") |>
  dplyr::left_join(geographr::lookup_lsoa11_msoa11, by = "lsoa11_code")

# Aggregate into MSOAs
imd_msoa <-
  imd_lsoa |>
  aggregate_scores(IMD_score, IMD_rank, IMD_decile, msoa11_code, total_population)

imd2015_msoa11_england <-
  imd_msoa |>
  select(-Score)

# Save output to data/ folder
usethis::use_data(imd2015_msoa11_england, overwrite = TRUE)
readr::write_csv(imd2015_msoa11_england, "data-raw/imd2015_msoa11_england.csv")
