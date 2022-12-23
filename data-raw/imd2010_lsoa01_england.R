library(tidyverse)
library(devtools)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2010_lsoa01_england") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

imd2010 <- read_excel(tf, sheet = "IMD 2010")

imd2010_lsoa01_england <-
  imd2010 |>
  select(
    lsoa01_code = `LSOA CODE`,
    lad09_code = `LA CODE`,
    lad09_name = `LA NAME`,
    IMD_score = `IMD SCORE`,
    IMD_rank = `RANK OF IMD SCORE (where 1 is most deprived)`
  ) |>
  mutate(
    IMD_decile = as.integer(Hmisc::cut2(IMD_rank, g = 10))
  )

# Save output to data/ folder
usethis::use_data(imd2010_lsoa01_england, overwrite = TRUE)
readr::write_csv(imd2010_lsoa01_england, "data-raw/imd2010_lsoa01_england.csv")
