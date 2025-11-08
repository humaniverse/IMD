# Load composite 2020 UK Index of Multiple Deprivation

Load data from mySociety's composite 2020 UK Index of Multiple
Deprivation: https://github.com/mysociety/composite_uk_imd.

## Usage

``` r
load_composite_imd(nation = "E")
```

## Arguments

- nation:

  The initial letter of the UK nation whose composite IMD you want to
  load. Should be one of: (E)ngland, (W)ales, (S)cotland (N)orthern
  Ireland. See the GitHub link about for more details about why there
  are separate composite IMDs for each nation.

## Examples

``` r
if (FALSE) { # \dontrun{
imd_uk <- load_composite_imd("E")
} # }
```
