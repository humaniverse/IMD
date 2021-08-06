## Test environments
* local Windows 10 install, R 4.1.0
* MacOS BigSur 11.5, R 4.1.0

## R CMD check results
There were no ERRORs or WARNINGs. 

There was one NOTE:

* checking R code for possible problems ... NOTE
  calculate_extent: no visible binding for global variable 'extent'
  calculate_pop_weighted_score: no visible binding for global variable
    'Score'
  calculate_proportion: no visible binding for global variable 'Top10'
  calculate_proportion: no visible binding for global variable 'Other'
  calculate_proportion: no visible binding for global variable
    'Proportion'
  load_composite_imd: no visible binding for global variable 'data_set'
  Undefined global functions or variables:
    Other Proportion Score Top10 data_set extent
(This is not an issue: the functions run without any problems.)

* This is a new release.
