library(tidyverse)
library(devtools)
library(readxl)
library(httr)

load_all(".")

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
  imd2010_lsoa01_england |>

  dplyr::left_join(pop_2010, by = "lsoa01_code") |>
  dplyr::left_join(geographr::lookup_lsoa11_ltla21, by = c("lsoa01_code" = "lsoa11_code"))

# Aggregate into LADs
imd_lad <-
  imd_lsoa |>
  aggregate_scores(IMD_score, IMD_rank, IMD_decile, ltla21_code, total_population)

imd2010_lad21_england <- imd_lad

# Save output to data/ folder
usethis::use_data(imd2010_lad21_england, overwrite = TRUE)
readr::write_csv(imd2010_lad21_england, "data-raw/imd2010_lad21_england.csv")
