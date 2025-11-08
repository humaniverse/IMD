# Proportion

Calculate proportion of small areas in the higher-level geography that
are within the 10

## Usage

``` r
calculate_proportion(data, var, higher_level_geography, max_quantile = 1)
```

## Arguments

- data:

  Data frame containing a variable to be aggregated, lower level
  geography population estimates, and a higher level geographical
  grouping variable

- var:

  Name of the variable in the data frame containing the variable to be
  aggregated (e.g. decile) for the lower level geography

- higher_level_geography:

  Name of the variable in the data frame containing the higher level
  geography names/codes

- max_quantile:

  Get proportion of small areas categorised as less than or equal to
  \`max_quantile\` (default = 1)
