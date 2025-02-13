library(tidyverse)
library(devtools)
library(readxl)
library(httr)
library(sf)

load_all(".")

# ---- Fetch LSOA (2001) to LSOA (2011) lookup ----
# Set query url
query_url <-
  query_urls |>
  filter(data_set == "lsoa01_lsoa11") |>
  pull(query_url)

lookup_lsoa01_lsoa11 <- read_sf(query_url)

lookup_lsoa01_lsoa11 <-
  lookup_lsoa01_lsoa11 |>
  st_drop_geometry() |>
  select(lsoa01_code = LSOA01CD, lsoa11_code = LSOA11CD)

# ---- Fetch population denominators ----
# Set query url
query_url <-
  query_urls |>
  filter(data_set == "pop10_lsoa") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

pop_2010 <- read_excel(tf, sheet = "Mid_2008")

pop_2010 <-
  pop_2010 |>
  select(
    lsoa01_code = `LSOA CODE`,
    total_population = `Total population: mid 2008 (excluding prisoners)`
  )

# ---- Calculate LA-level IMD for 2010 ----
imd_lsoa <-
  imd2010_england_lsoa01 |>

  left_join(lookup_lsoa01_lsoa11) |>
  left_join(pop_2010, by = "lsoa01_code") |>
  left_join(geographr::lookup_lsoa11_ltla21, by = "lsoa11_code")

# Aggregate into LADs
imd_lad <-
  imd_lsoa |>
  aggregate_scores(IMD_score, IMD_rank, IMD_decile, ltla21_code, total_population)

imd2010_england_ltla21 <- imd_lad

# Save output to data/ folder
usethis::use_data(imd2010_england_ltla21, overwrite = TRUE)
