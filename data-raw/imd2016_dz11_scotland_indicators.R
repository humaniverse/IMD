library(tidyverse)
library(devtools)
library(compositr)
library(readxl)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2016_dz11_scotland_indicators") |>
  pull(query_url)

tf <- download_file(query_url, ".xlsx")

imd2016_dz11_scotland_indicators <- read_excel(tf, sheet = "Data")

imd2016_dz11_scotland_indicators <-
  imd2016_dz11_scotland_indicators |>
  rename(dz11_code = Data_Zone) |>
  select(-Intermediate_Zone, -Council_area)

# Save output to data/ folder
usethis::use_data(imd2016_dz11_scotland_indicators, overwrite = TRUE)
readr::write_csv(imd2016_dz11_scotland_indicators, "data-raw/imd2016_dz11_scotland_indicators.csv")
