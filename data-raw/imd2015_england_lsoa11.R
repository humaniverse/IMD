library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# ---- Load IMD ranks and deciles ----
# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2015_lsoa11_england") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

imd2015 <- read_excel(tf, sheet = "IMD 2015")

# ---- Load IMD scores ----
# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2015_lsoa11_england_scores") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

imd2015_scores <- read_excel(tf, sheet = "ID2015 Scores")

imd2015_scores <-
  imd2015_scores |>
  select(`LSOA code (2011)`, `Index of Multiple Deprivation (IMD) Score`)

# ---- Construct IMD ----
imd2015_england_lsoa11 <-
  imd2015 |>
  left_join(imd2015_scores) |>
  select(
    lsoa11_code = `LSOA code (2011)`,
    lsoa11_name = `LSOA name (2011)`,
    lad13_code = `Local Authority District code (2013)`,
    lad13_name = `Local Authority District name (2013)`,
    IMD_score = `Index of Multiple Deprivation (IMD) Score`,
    IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`,
    IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`
  )

# Save output to data/ folder
usethis::use_data(imd2015_england_lsoa11, overwrite = TRUE)
