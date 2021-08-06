# IMD <img src='man/figures/imd-logo.png' align="right" height="150" /></a>

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

## Overview
Indices of Multiple Deprivation for the UK's nations at various geographical levels:

- England: Lower Layer Super Output Area (LSOA), Middle Layer Super Output Area (MSOA), Ward, and Local Authority
- Wales: LSOA, MSOA, Ward, and Local Authority
- Scotland: Data Zone, Intermediate Zone, and Council Area
- Northern Ireland: Super Output Area and Local Government District

## Installation
You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("matthewgthomas/IMD")
```

## Usage
The `IMD` package provides several datasets for the IMD in each UK nation:

England:

- Lower Layer Super Output Areas: `IMD::imd_england_lsoa`
- Middle Layer Super Output Areas: `IMD::imd_england_msoa`
- Wards: `IMD::imd_england_ward`
- Local Authorities: `IMD::imd_england_lad`

Wales:

- Lower Layer Super Output Areas: `IMD::imd_wales_lsoa`
- Middle Layer Super Output Areas: `IMD::imd_wales_msoa`
- Wards: `IMD::imd_wales_ward`
- Local Authorities: `IMD::imd_wales_lad`

Scotland:
- Data Zones: `IMD::imd_scotland_dz`
- Intermediate Zones: `IMD::imd_scotland_iz`
- Council Areas: `IMD::imd_scotland_lad`

Northern Ireland:

- Super Output Areas: `IMD::imd_northern_ireland_soa`
- Local Government Districts: `IMD::imd_northern_ireland_lad`

### Composite 2020 UK Index of Multiple Deprivation
We have also included the [composite 2020 UK Index of Multiple Deprivation](https://github.com/mysociety/composite_uk_imd) produced by mySociety, allowing comparison of deprivation across UK nations. For more information about how and when to use this version of the IMD, see [their README](https://github.com/mysociety/composite_uk_imd/blob/master/readme.md).

Rather than providing a copy of this data, the `IMD` package gives URLs to the data hosted on mySociety's GitHub. To load these files, run the following code:

```r
query_url <-
  IMD::query_urls |>
  dplyr::filter(data_set == "imd_uk_e") |>  # for other nations, use: "imd_uk_w", "imd_uk_s" or "imd_uk_n"
  dplyr::pull(query_url)

imd_uk_e <-
  readr::read_csv(query_url)
```

### Functions for aggregating small area data into higher-level geographies
You can also use the functions we'ved used for aggregating data into higher-level geographies:

- `IMD::calculate_pop_weighted_score(...)`: calculate population-weighted average scores within the higher-level geography
- `IMD::calculate_proportion(...)`: calculate the proportion of small areas in the higher-level geography that are within the 10% most deprived areas in the nation (or another decile of your choosing).
- `IMD::calculate_extent(...)` - calculate the 'extent', which is the proportion of a local population living in areas classified as among the most deprived in the nation
- `IMD::aggregate_scores(...)` - this function combines the above three functions into one place

For more information about how to use these functions, see the manual pages for each.

## Getting help
If you encounter a clear bug, please file an issue with a minimal reproducible example on [GitHub](https://github.com/matthewgthomas/IMD/issues).

---
Please note that this project is released with a [Contributor Code of Conduct](https://www.contributor-covenant.org/version/2/0/code_of_conduct/). By participating in this project you agree to abide by its terms.
