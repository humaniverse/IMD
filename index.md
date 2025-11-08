# IMD

The `IMD` package provides easy access to the Indices of Multiple
Deprivation for the UK’s nations at various geographical levels:

- England: Lower Layer Super Output Area (LSOA), Middle Layer Super
  Output Area (MSOA), Local Authority, Integrated Care Board, and Local
  Resilience Forum (includes new data for 2025)
- Wales: LSOA, MSOA, Ward, and Local Authority
- Scotland: Data Zone, Intermediate Zone, and Council Area
- Northern Ireland: Super Output Area and Local Government District

The package also provides data files for the Community Needs Index for
each UK nation, as well as household-level multiple deprivation figures
for England, Wales and Northern Ireland (from the 2011 and 2021
Censuses).

## Installation

Install the released version of `IMD` from
[CRAN](https://cran.r-project.org/package=IMD):

``` r
install.packages("IMD")
```

Alternatively, you can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("humaniverse/IMD")
```

## Usage

The `IMD` package provides several datasets for the IMD in each UK
nation. The format for the names of the data files follows this format:

``` R
imd[year]_[nation]_[geography code]
```

### Composite 2020 UK Index of Multiple Deprivation

We have also included the [composite 2020 UK Index of Multiple
Deprivation](https://github.com/mysociety/composite_uk_imd) produced by
mySociety, allowing comparison of deprivation across UK nations. For
more information about how and when to use this version of the IMD, see
[their
README](https://github.com/mysociety/composite_uk_imd/blob/master/readme.md).

Rather than providing a copy of this data, the `IMD` package loads the
data hosted on mySociety’s GitHub. To load these files, run the
following code:

``` r
imd_uk <- load_composite_imd(nation = "E")
```

This function defaults to loading the England-focused composite index;
change the `nation` parameter to the first letter of one of the devolved
UK nations to load the other versions.

## Example

How many Council Areas (Local Authorities) in Scotland where at least
one-third of the population lives in areas classified as among the most
deprived?

``` r
library(IMD)

imd2020_scotland_ltla24 |> 
  dplyr::filter(Extent >= 0.33) |> 
  dplyr::count()
#> # A tibble: 1 × 1
#>       n
#>   <int>
#> 1     5
```

## Accessing the data for non-R users

You can download the data from R-Universe via
<https://humaniverse.r-universe.dev/datasets>

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on
[GitHub](https://github.com/humaniverse/IMD/issues).

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of
Conduct](https://www.contributor-covenant.org/version/2/0/code_of_conduct/).
By participating in this project you agree to abide by its terms.
