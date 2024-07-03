library(tidyverse)
library(readxl)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd_soa_ni") |>
  pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

# ---- Income ----
income <- read_excel(tf, sheet = "Income")

income <- income |>
  select(soa_code = SOA2001, starts_with("Proportion"))

# ---- Employment ----
employment <- read_excel(tf, sheet = "Employment")

employment <- employment |>
  select(soa_code = SOA2001, starts_with("Proportion"))

# ---- Health and Disability ----
health <- read_excel(tf, sheet = "Health and Disability")

health <- health |>
  select(-1, -2, -4, -5) |>
  rename(soa_code = SOA2001)

# ---- Education ----
education <- read_excel(tf, sheet = "Education, Skills and Training ")

education <- education |>
  select(-1, -2, -4, -5) |>
  rename(soa_code = SOA2001)

# ---- Access to services ----
access <- read_excel(tf, sheet = "Access to Services")

access <- access |>
  select(-1, -2, -4, -5) |>
  rename(soa_code = SOA2001)

# ---- Living environment ----
env <- read_excel(tf, sheet = "Living Environment")

env <- env |>
  select(-1, -2, -4, -5) |>
  rename(soa_code = SOA2001)

# ---- Crime and disorder ----
crime <- read_excel(tf, sheet = "Crime and Disorder")

crime <- crime |>
  select(-1, -2, -4, -5) |>
  rename(soa_code = SOA2001)

# ---- IDAC and IDAP ----
ida <- read_excel(tf, sheet = "IDAC and IDAP")

ida <- ida |>
  select(-1, -2, -4) |>
  rename(soa_code = SOA2001)

# ---- Combine ----
imd2017_soa01_northern_ireland <-
  income |>
  left_join(employment) |>
  left_join(health) |>
  left_join(education) |>
  left_join(access) |>
  left_join(env) |>
  left_join(crime) |>
  left_join(ida)

# Save output to data/ folder
usethis::use_data(imd2017_soa01_northern_ireland, overwrite = TRUE)
readr::write_csv(imd2017_soa01_northern_ireland, "data-raw/imd2017_soa01_northern_ireland.csv")
