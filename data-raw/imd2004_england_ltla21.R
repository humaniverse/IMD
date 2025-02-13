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
  filter(data_set == "pop07_lsoa") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

pop_2007 <- read_excel(tf, sheet = "Mid-2005 Population at Risk")

pop_2007 <-
  pop_2007 |>
  select(
    lsoa01_code = lsoacode,
    total_population = `Total population: mid 2005 (excluding prisoners)`
  )

# ---- Calculate MSOA-level IMD for 2010 ----
imd_lsoa <-
  imd2004_lsoa01_england |>

  left_join(lookup_lsoa01_lsoa11) |>
  left_join(pop_2004, by = "lsoa01_code") |>
  left_join(geographr::lookup_lsoa11_ltla21, by = "lsoa11_code")

# Aggregate into LADs
imd_lad <-
  imd_lsoa |>
  aggregate_scores(IMD_score, IMD_rank, IMD_decile, ltla21_code, total_population)

imd2004_england_ltla21 <- imd_lad

# Save output to data/ folder
usethis::use_data(imd2004_england_ltla21, overwrite = TRUE)
