library(tidyverse)
library(httr2)

# Load package
devtools::load_all(".")

# Query URL constructed using https://api.stats.gov.wales/v1/docs/#/
# Dataset ID taken from URL link  https://stats.gov.wales/en-GB/f30cc8bc-8e97-449e-96a4-77b0400262d1

query_url <-
  query_urls |>
  filter(data_set == "imd2025_ltla24_wales") |>
  pull(query_url)

response <- request(query_url) |>
  req_perform()

csv_text <- resp_body_string(response)

raw <- read_csv(csv_text)

imd2025_wales_ltla24 <- raw |>
  select(
    ltla24_code = `Area code`,
    domain = Domain,
    deprivation_group = `Deprivation group`,
    data_description = `Data description`,
    data_values = `Data values`
  )

# Save output to data/ folder
usethis::use_data(imd2025_wales_ltla24, overwrite = TRUE)
