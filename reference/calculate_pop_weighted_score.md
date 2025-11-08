# Population-weighted scores

Calculate population-weighted scores within small areas.

## Usage

``` r
calculate_pop_weighted_score(data, var, higher_level_geography, population)
```

## Arguments

- data:

  Data frame containing a variable to be aggregated, lower level
  geography population estimates, and a higher level geographical
  grouping variable

- var:

  Name of the variable in the data frame containing the variable to be
  aggregated (e.g. rank) for the lower level geography

- higher_level_geography:

  Name of the variable in the data frame containing the higher level
  geography names/codes

- population:

  Name of the variable in the data frame containing the population
  estimates of the lower level geography
