library(tidyverse)
library(devtools)
library(httr)
library(readxl)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2020_dz11_scotland_indicators") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xlsx"))
)

imd2020_scotland_dz11_indicators <- read_excel(tf, sheet = "Data")

imd2020_scotland_dz11_indicators <-
  imd2020_scotland_dz11_indicators |>
  rename(dz11_code = Data_Zone) |>
  select(-Intermediate_Zone, -Council_area)

# Save output to data/ folder
usethis::use_data(imd2020_scotland_dz11_indicators, overwrite = TRUE)
