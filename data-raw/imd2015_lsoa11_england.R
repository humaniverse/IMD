library(tidyverse)
library(devtools)

# Load package
load_all(".")

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

imd2015_lsoa11_england <-
  imd2015 |>
  select(
    lsoa11_code = `LSOA code (2011)`,
    lsoa11_name = `LSOA name (2011)`,
    lad13_code = `Local Authority District code (2013)`,
    lad13_name = `Local Authority District name (2013)`,
    IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`,
    IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`
  )

# Save output to data/ folder
usethis::use_data(imd2015_lsoa11_england, overwrite = TRUE)
readr::write_csv(imd2015_lsoa11_england, "data-raw/imd2015_lsoa11_england.csv")
