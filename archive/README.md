# Index of Multiple Deprivation

This repo provides each UK nation's Index of Multiple Deprivation in a single file as well as the indices aggregated into higher-level geographies.

## UK-wide deprivation

[`UK IMD domains.csv`](https://github.com/matthewgthomas/IMD/raw/master/data/UK%20IMD%20domains.csv) presents the [English indices of deprivation 2019](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019), [Welsh Index of Multiple Deprivation 2019](https://statswales.gov.wales/Catalogue/Community-Safety-and-Social-Inclusion/Welsh-Index-of-Multiple-Deprivation/WIMD-2019), [Scottish Index of Multiple Deprivation 2020](https://www.gov.scot/collections/scottish-index-of-multiple-deprivation-2020), and [Northern Ireland Multiple Deprivation Measure 2017](https://www.nisra.gov.uk/statistics/deprivation/northern-ireland-multiple-deprivation-measure-2017-nimdm2017) in one file. Deprivation ranks and deciles are given for each small area in each nation (Lower Layer Super Output Areas in England and Wales, Data Zones in Scotland, and Super Output Areas in Northern Ireland).

Note that deprivation isn't comparable between nations but you can look at which areas are in the 10% most deprived of each nation (for example). [Alex Parsons](https://twitter.com/alexparsons) at mySociety has produced a dataset using a method to unify the deprivation indices, allowing comparison across nations - see [this article](https://www.mysociety.org/2021/04/22/unified-uk-measures-of-rurality-and-deprivation/) and [this repo](https://github.com/mysociety/composite_uk_imd) for details.

## Deprivation in higher geographies

These files aggregate the small area deprivation indices into higher geographies. Deprivation at higher-level geographies is presented in three ways:

- population-weighted average deprivation scores (the `Score` column)
- proportions of neighbourhoods within a higher geography that are in a nation's most deprivation 10% nationally (the `Proportion` column)
- proportion of a neighbourhood's population that are in a nation's most deprivation 10% nationally (the `Extent` column)

For details on how these are calculated, see the code in `functions.r` and read Appendix N of the [English IMD's technical report](https://www.gov.uk/government/publications/english-indices-of-deprivation-2019-technical-report).

### Files

**Middle Layer Super Output Areas** for [England](https://github.com/matthewgthomas/IMD/blob/master/data/English%20IMD%20-%20MSOA.csv) and [Wales](https://github.com/matthewgthomas/IMD/blob/master/data/Welsh%20IMD%20-%20MSOA.csv), and Intermediate Zones for [Scotland](https://github.com/matthewgthomas/IMD/blob/master/data/Scottish%20IMD%20-%20MSOA.csv). (Northern Ireland doesn't have an equivalent geography at this level.)

**Wards** for England, using [2017 ward codes](https://github.com/matthewgthomas/IMD/blob/master/data/English%20IMD%20-%20Ward%202017.csv) and [2020 ward codes](https://github.com/matthewgthomas/IMD/blob/master/data/English%20IMD%20-%20Ward%202020.csv). Wards for Wales using [2017 codes](https://github.com/matthewgthomas/IMD/blob/master/data/Welsh%20IMD%20-%20Ward%202017.csv) and [2020 codes](https://github.com/matthewgthomas/IMD/blob/master/data/Welsh%20IMD%20-%20Ward%202020.csv). (Ward-level deprivation for Scotland and Northern Ireland coming soon.)

**Local Authorities** for [England](https://github.com/matthewgthomas/IMD/blob/master/data/English%20IMD%20-%20Local%20Authorities.csv) and [Wales](https://github.com/matthewgthomas/IMD/blob/master/data/Welsh%20IMD%20-%20Local%20Authorities.csv), [Scotland's Council Areas](https://github.com/matthewgthomas/IMD/blob/master/data/Scottish%20IMD%20-%20Local%20Authorities.csv), and [Northern Ireland's Local Government Districts](https://github.com/matthewgthomas/IMD/blob/master/data/NI%20IMD%20-%20Local%20Authorities.csv).

## Source code
`prep deprivation.r` combines each UK nation's IMD data into a single table: saved as `./data/UK IMD domains.csv`

`prep map.r` produces shapefiles showing the 10% most deprived LSOAs (or equivalents) in each nation.

`functions.r` contains the functions used to aggregate deprivation into higher geographies.

The `aggregate deprivation into higher geographies...` files do the aggregation for different geographies.

`deprivation.Rmd` shows the 10% most deprived areas on an interactive map.
