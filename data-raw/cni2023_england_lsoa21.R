library(tidyverse)
library(usethis)

# devtools::install_github("humaniverse/geographr")
library(geographr)

# devtools::install_github("humaniverse/compositr")
library(compositr)

devtools::load_all()

cni2023_england_lsoa21 <- read_csv("data-raw/community-needs-index-england-2023.csv")

cni2023_england_lsoa21 <-
  cni2023_england_lsoa21 |>
  select(
    lsoa21_code = `LSOA Code`,
    lsoa21_name = `LSOA Name`,`Community Needs Index 2023 Score`,
    `Community Needs Index 2023 Score`:`Active and Engaged Community Domain Rank`
  ) |>
  filter(!is.na(lsoa21_code))

# Which of the LSOAs are in the lowest 10% of the Community Needs Index and the IMD?
left_behind <-
  cni2023_england_lsoa21 |>
  select(lsoa21_code, `Community Needs Index 2023 Rank`) |>

  # Calculate deciles from CNI ranks
  mutate(CNI_decile = compositr::quantise(`Community Needs Index 2023 Rank`, num_quantiles = 10)) |>

  # Use LSOA (2011) to LSOA (2021) lookup then merge IMD
  left_join(geographr::lookup_lsoa11_lsoa21_ltla22) |>
  left_join(
    imd_england_lsoa |> select(lsoa_code, IMD_decile),
    by = c("lsoa11_code" = "lsoa_code")
  ) |>

  # Mark left-behind areas
  mutate(`Left Behind Area?` = (CNI_decile == 1 & IMD_decile == 1))

# Check for duplicates, due to LSOA code changes between 2011 and 2021
# left_behind |>
#   filter(`Left Behind Area?`) |>
#   count(lsoa21_code, sort = TRUE)
#
# left_behind |>
#   filter(lsoa21_code %in% c("E01034069", "E01034517", "E01035464", "E01035473"))
#--> The duplicates aren't a problem - they all are in the same IMD and CNI deciles

# Get the list of LBAs
left_behind <-
  left_behind |>
  filter(`Left Behind Area?`) |>
  select(lsoa21_code, `Left Behind Area?`) |>
  distinct()

# Merge LBAs into CNI
cni2023_england_lsoa21 <-
  cni2023_england_lsoa21 |>
  left_join(left_behind) |>
  mutate(`Left Behind Area?` = if_else(is.na(`Left Behind Area?`), FALSE, `Left Behind Area?`))

use_data(cni2023_england_lsoa21, overwrite = TRUE)
