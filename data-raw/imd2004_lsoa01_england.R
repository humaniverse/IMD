library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2004_lsoa01_england") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())

imd2004 <- read_excel(file.path(tempdir(), "SOA levelid2004.xls"), sheet = "IMD 2004")

# Select data and calculate deciles
imd2004_lsoa01_england <-
  imd2004 |>
  select(
    lsoa01_code = SOA,
    lad04_code = `LA CODE`,
    lad04_name = `LA NAME`,
    IMD_score = `IMD SCORE`,
    IMD_rank = `RANK OF IMD (where 1 is most deprived)`
  ) |>
  mutate(
    IMD_decile = as.integer(Hmisc::cut2(IMD_rank, g = 10))
  )

# Save output to data/ folder
usethis::use_data(imd2004_lsoa01_england, overwrite = TRUE)
readr::write_csv(imd2004_lsoa01_england, "data-raw/imd2004_lsoa01_england.csv")
