library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2007_lsoa01_england") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".zip"))
)

unzip(tf, exdir = tempdir())

imd2007 <- read_excel(file.path(tempdir(), "IMD 2007 for DCLG 4 dec.xls"), sheet = "IMD 2007")

# Select data and calculate deciles
imd2007_england_lsoa01 <-
  imd2007 |>
  select(
    lsoa01_code = LSOA,
    lad07_code = `LA CODE`,
    lad07_name = `LA NAME`,
    IMD_score = `IMD SCORE`,
    IMD_rank = `RANK OF IMD (where 1 is most deprived)`
  ) |>
  mutate(
    IMD_decile = as.integer(Hmisc::cut2(IMD_rank, g = 10))
  )

# Save output to data/ folder
usethis::use_data(imd2007_england_lsoa01, overwrite = TRUE)
