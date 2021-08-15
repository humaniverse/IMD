# ---- Build data ----
# ONS geoportal query urls can be found on the "API Explorer" tab.
query_urls <-
  tibble::tribble(
    # Column Names
    ~data_set, ~type, ~notes, ~query_url, ~source,

    # Deprivation
    "imd_lsoa_england", "imd", "LSOA-level deprivation in England", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/845345/File_7_-_All_IoD2019_Scores__Ranks__Deciles_and_Population_Denominators_3.csv", "https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019",
    "imd_lsoa_wales", "imd", "LSOA-level deprivation in Wales", "https://gov.wales/sites/default/files/statistics-and-research/2019-11/welsh-index-multiple-deprivation-2019-index-and-domain-ranks-by-small-area.ods", "https://gov.wales/welsh-index-multiple-deprivation-full-index-update-ranks-2019",
    "imd_dz_scotland", "imd", "DZ-level deprivation in Scotland", "https://www.gov.scot/binaries/content/documents/govscot/publications/statistics/2020/01/scottish-index-of-multiple-deprivation-2020-ranks-and-domain-ranks/documents/scottish-index-of-multiple-deprivation-2020-ranks-and-domain-ranks/scottish-index-of-multiple-deprivation-2020-ranks-and-domain-ranks/govscot%3Adocument/SIMD_2020_Ranks_and_Domain_Ranks.xlsx", "https://simd.scot",
    "imd_soa_ni", "imd","SOA-level deprivation in Northern Ireland", "https://www.nisra.gov.uk/sites/nisra.gov.uk/files/publications/NIMDM17_SOAresults.xls", "https://www.nisra.gov.uk/statistics/deprivation/northern-ireland-multiple-deprivation-measure-2017-nimdm2017",
    "imd_lad_england", "imd", "Local Authority deprivation in England", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/833995/File_10_-_IoD2019_Local_Authority_District_Summaries__lower-tier__.xlsx", "https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019",
    "imd_uk_e", "imd", "Composite 2020 UK Index of Multiple Deprivation: England", "https://github.com/mysociety/composite_uk_imd/raw/master/uk_index/UK_IMD_E.csv", "https://github.com/mysociety/composite_uk_imd",
    "imd_uk_w", "imd", "Composite 2020 UK Index of Multiple Deprivation: Wales", "https://github.com/mysociety/composite_uk_imd/raw/master/uk_index/UK_IMD_W.csv", "https://github.com/mysociety/composite_uk_imd",
    "imd_uk_s", "imd", "Composite 2020 UK Index of Multiple Deprivation: Scotland", "https://github.com/mysociety/composite_uk_imd/raw/master/uk_index/UK_IMD_S.csv", "https://github.com/mysociety/composite_uk_imd",
    "imd_uk_n", "imd", "Composite 2020 UK Index of Multiple Deprivation: NI", "https://github.com/mysociety/composite_uk_imd/raw/master/uk_index/UK_IMD_N.csv", "https://github.com/mysociety/composite_uk_imd",
    "imd_england_subdomains", "imd", "Sub-domains of LSOA-level deprivation in England", "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/833976/File_4_-_IoD2019_Sub-domains_of_Deprivation.xlsx", "https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019",

    # Lookups
    "lsoa_msoa_lad", "lookup", "Output Area to LSOA to MSOA to Local Authority District (December 2017) Lookup with Area Classifications in Great Britain", "https://opendata.arcgis.com/datasets/fe6c55f0924b4734adf1cf7104a0173e_0.csv", "http://geoportal.statistics.gov.uk/datasets/fe6c55f0924b4734adf1cf7104a0173e_0",
    "lsoa_ward", "lookup", "Lower Layer Super Output Area (2011) to Ward (2019) Lookup in England and Wales", "https://opendata.arcgis.com/datasets/15299a7b8e6c498d94a08b687c75b73f_0.csv", "https://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-area-2011-to-ward-2019-lookup-in-england-and-wales",
    "msoa_lad", "lookup", "Middle Layer Super Output Area (2011) to Ward to LAD (December 2019)", "https://services1.arcgis.com/ESMARspQHYMw9BZ9/arcgis/rest/services/MSOA11_WD19_LAD19_EW_LU/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json", "https://geoportal.statistics.gov.uk/datasets/0b3c76d1eb5e4ffd98a3679ab8dea605_0/geoservice",
    "dz_iz_lad", "lookup", "Data zone to intermediate zone and local authority in Scotland", "https://www.gov.scot/binaries/content/documents/govscot/publications/statistics/2020/01/scottish-index-of-multiple-deprivation-2020-data-zone-look-up-file/documents/scottish-index-of-multiple-deprivation-data-zone-look-up/scottish-index-of-multiple-deprivation-data-zone-look-up/govscot%3Adocument/SIMD_2020_Datazone_lookup_tool.xlsx", "https://www.gov.scot/publications/scottish-index-of-multiple-deprivation-2020-data-zone-look-up/",
    "sa_soa_lgd", "lookup", "Small Areas (2011) to SOAs to Local Government Districts (December 2018) Lookup with Area Classifications in Northern Ireland", "https://opendata.arcgis.com/datasets/096a7ccbc8e244cc972189b2f07a321a_0.csv", "https://geoportal.statistics.gov.uk/datasets/small-areas-2011-to-soas-to-local-government-districts-december-2018-lookup-with-area-classifications-in-northern-ireland",

    # Population estimates
    "pop_lsoa", "population", "Lower layer Super Output Area population estimates: mid-2019", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2flowersuperoutputareamidyearpopulationestimates%2fmid2019sape22dt2/sape22dt2mid2019lsoasyoaestimatesunformatted.zip", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareamidyearpopulationestimates",
    "pop_dz", "population", "Scotland Data Zone population estimates: mid-2019", "https://www.opendata.nhs.scot/datastore/dump/c505f490-c201-44bd-abd1-1bd7a64285ee?bom=True", "https://www.opendata.nhs.scot/dataset/population-estimates/resource/c505f490-c201-44bd-abd1-1bd7a64285ee",
    "pop_soa", "population", "Northern Ireland Super Output Area population estimates: mid-2019", "https://www.nisra.gov.uk/sites/nisra.gov.uk/files/publications/MYE19_SOA_WARD.xlsx", "https://www.nisra.gov.uk/publications/2019-mid-year-population-estimates-northern-ireland"
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
