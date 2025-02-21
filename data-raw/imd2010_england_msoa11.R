library(tidyverse)
library(geographr)
library(devtools)
library(readxl)
library(httr)
library(sf)

load_all(".")

# ---- Fetch LSOA (2001) to LSOA (2011) lookup ----
lookup_lsoa01_lsoa11 <-
  lookup_lsoa01_lsoa11 |>
  select(lsoa01_code, lsoa11_code)

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

# ---- Calculate MSOA-level IMD for 2010 ----
imd_lsoa <-
  imd2010_england_lsoa01 |>

  left_join(lookup_lsoa01_lsoa11) |>
  left_join(pop_2010, by = "lsoa01_code") |>
  left_join(geographr::lookup_lsoa11_msoa11, by = "lsoa11_code")

# Aggregate into MSOAs
imd_msoa <-
  imd_lsoa |>
  aggregate_scores(IMD_score, IMD_rank, IMD_decile, msoa11_code, total_population)

imd2010_england_msoa11 <- imd_msoa

# Save output to data/ folder
usethis::use_data(imd2010_england_msoa11, overwrite = TRUE)
