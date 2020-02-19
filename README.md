# Index of Multiple Deprivation

Containing:

- [English indices of deprivation 2019](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019)
- [Welsh Index of Multiple Deprivation 2019](https://statswales.gov.wales/Catalogue/Community-Safety-and-Social-Inclusion/Welsh-Index-of-Multiple-Deprivation/WIMD-2019)
- [Scottish Index of Multiple Deprivation 2020](https://www.gov.scot/collections/scottish-index-of-multiple-deprivation-2020)
- [Northern Ireland Multiple Deprivation Measure 2017](https://www.nisra.gov.uk/statistics/deprivation/northern-ireland-multiple-deprivation-measure-2017-nimdm2017)

`prep deprivation.r` combines each UK nation's IMD data into a single table: saved as `./data/UK IMD domains.csv`

`prep map.r` produces shapefiles showing the 10% most deprived LSOAs (or equivalents) in each nation.

`deprivation.Rmd` shows the 10% most deprived areas on an interactive map.
