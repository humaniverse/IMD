library(httr2)
library(tidyverse)

# Load package
devtools::load_all(".")

# Query URL constructed using https://api.stats.gov.wales/v1/docs/#/
# Dataset ID taken from URL link  https://stats.gov.wales/en-GB/d22b81a1-6c99-4527-986b-2a529567cfba

query_url <-
  query_urls |>
  filter(data_set == "imd2025_msoa21_wales") |>
  pull(query_url)

response <- request(query_url) |>
  req_perform()

csv_text <- resp_body_string(response)

raw <- read_csv(csv_text)

imd2025_wales_msoa21 <- raw |>
  select(
    msoa21_code = `Area code`,
    domain = Domain,
    deprivation_group = `Deprivation group`,
    data_description = `Data description`,
    data_values = `Data values`
  )

# Save output to data/ folder
usethis::use_data(imd2025_wales_msoa21, overwrite = TRUE)
