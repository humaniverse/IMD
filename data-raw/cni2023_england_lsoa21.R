library(tidyverse)
library(usethis)

# devtools::install_github("humaniverse/geographr")
library(geographr)

# devtools::install_github("humaniverse/compositr")
library(compositr)

devtools::load_all()

cni2023_england_lsoa21 <- read_csv("data-raw/cni2023_england_lsoa21.csv")

cni2023_england_lsoa21 <-
  cni2023_england_lsoa21 |>
  select(
    lsoa21_code,
    lsoa21_name,
    `Community Needs Index 2023 Score`,
    `Community Needs Index 2023 Score`:`Active and Engaged Community Domain Rank`
  ) |>
  filter(!is.na(lsoa21_code))

# Which of the LSOAs are in the lowest 10% of the Community Needs Index and the IMD?
left_behind <-
  cni2023_england_lsoa21 |>
  select(lsoa21_code, `Community Needs Index 2023 Rank`) |>

  # Calculate deciles from CNI ranks
  mutate(
    CNI_decile = ntile(
      `Community Needs Index 2023 Rank`,
      n = 10
    )
  ) |>

  # Merge IMD 2025
  left_join(
    imd2025_england_lsoa21 |> select(lsoa21_code, IMD_decile)
  ) |>

  # Mark left-behind areas
  mutate(`Left Behind Area?` = (CNI_decile == 1 & IMD_decile == 1))

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
  mutate(
    `Left Behind Area?` = if_else(
      is.na(`Left Behind Area?`),
      FALSE,
      `Left Behind Area?`
    )
  )

use_data(cni2023_england_lsoa21, overwrite = TRUE)
