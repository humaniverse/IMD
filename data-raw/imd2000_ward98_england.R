library(tidyverse)
library(devtools)
library(readxl)
library(httr)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2000_ward98_england") |>
  pull(query_url)

GET(
  query_url,
  write_disk(tf <- tempfile(fileext = ".xls"))
)

imd2000 <- read_excel(tf, sheet = "All")

# Calculate deciles
imd2000_ward98_england <-
  imd2000 |>
  mutate(
    IMD_decile = as.integer(Hmisc::cut2(`Rank of Index of Multiple Deprivation`, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(`Rank of Income Domain`, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(`Rank of Employment Domain`, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(`Rank of Health Domain`, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(`Rank of Education Domain`, g = 10)),
    Housing_decile = as.integer(Hmisc::cut2(`Rank of Housing Domain`, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(`Rank of Access Domain`, g = 10)),
    Child_Poverty_decile = as.integer(Hmisc::cut2(`Rank of Child Poverty Index`, g = 10)),
  )

# Save output to data/ folder
usethis::use_data(imd2000_ward98_england, overwrite = TRUE)
readr::write_csv(imd2000_ward98_england, "data-raw/imd2000_ward98_england.csv")
