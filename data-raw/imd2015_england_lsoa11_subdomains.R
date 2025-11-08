library(tidyverse)
library(devtools)
library(janitor)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2015_lsoa11_england_indicators") |>
  pull(query_url)

imd2015 <- read_csv(query_url)

imd2015_england_lsoa11_subdomains <-
  imd2015 |>
  select(
    lsoa11_code = `LSOA code (2011)`,
    contains("Sub-domain")
  ) |>
  rename_with(~ str_remove(.x, fixed(" (where 1 is most deprived)"))) |> 
  rename_with(~ str_remove(.x, fixed(" (where 1 is most deprived 10% of LSOAs)"))) |> 
  clean_names()

# Save output to data/ folder
usethis::use_data(imd2015_england_lsoa11_subdomains, overwrite = TRUE)
