#' @importFrom tibble tibble
NULL

#' Census "Households by deprivation" data for LSOAs in England and Wales
#'
#' This dataset provides Census 2021 estimates that classify households in
#' England and Wales by four dimensions of deprivation: Employment, education,
#' health and disability, and household overcrowding.
#'
#' @format A data frame of class "tbl" with 178,360 rows and 4 variables:
#' \describe{
#'   \item{lsoa21_code}{LSOA 2021 code}
#'   \item{households_number_deprivation_dimensions}{The number of dimensions of deprivation}
#'   \item{count}{Count of households}
#'   \item{percent}{Percentage of households}
#'   ...
#' }
#' @source \url{https://www.nomisweb.co.uk/}
"census21_deprivation_england_wales_lsoa21"

#' Census "Households by deprivation" data for MSOAs in England and Wales
#'
#' This dataset provides Census 2021 estimates that classify households in
#' England and Wales by four dimensions of deprivation: Employment, education,
#' health and disability, and household overcrowding.
#'
#' @format A data frame of class "tbl" with 36,320 rows and 4 variables:
#' \describe{
#'   \item{msoa21_code}{MSOA 2021 code}
#'   \item{households_number_deprivation_dimensions}{The number of dimensions of deprivation}
#'   \item{count}{Count of households}
#'   \item{percent}{Percentage of households}
#'   ...
#' }
#' @source \url{https://www.nomisweb.co.uk/}
"census21_deprivation_england_wales_msoa21"

#' Census "Households by deprivation" data for LSOAs in England and Wales
#'
#' This dataset provides Census 2011 estimates that classify households in
#' England and Wales by four dimensions of deprivation: Employment, education,
#' health and disability, and household overcrowding.
#'
#' @format A data frame of class "tbl" with 173,765 rows and 4 variables:
#' \describe{
#'   \item{lsoa11_code}{LSOA 2011 code}
#'   \item{households_number_deprivation_dimensions}{The number of dimensions of deprivation}
#'   \item{count}{Number of households}
#'   \item{proportion}{Proportion of households}
#'   ...
#' }
#' @source \url{https://www.nomisweb.co.uk/}
"census11_deprivation_england_wales_lsoa11"

#' Census "Households by deprivation" data for MSOAs in England and Wales
#'
#' This dataset provides Census 2011 estimates that classify households in
#' England and Wales by four dimensions of deprivation: Employment, education,
#' health and disability, and household overcrowding.
#'
#' @format A data frame of class "tbl" with 36,005 rows and 4 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA 2011 code}
#'   \item{households_number_deprivation_dimensions}{The number of dimensions of deprivation}
#'   \item{count}{Number of households}
#'   \item{proportion}{Proportion of households}
#'   ...
#' }
#' @source \url{https://www.nomisweb.co.uk/}
"census11_deprivation_england_wales_msoa11"

#' Index of Multiple Deprivation (2025) for ICBs (2024) in England
#'
#' A dataset containing IMD scores, ranks, and related measures for Integrated Care Boards in England.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{icb24_code}{ICB code}
#'   \item{icb24_name}{ICB name}
#'   \item{IMD - Average rank}{IMD - Average rank}
#'   \item{IMD - Rank of average rank}{IMD - Rank of average rank}
#'   \item{IMD - Average score}{IMD - Average score}
#'   \item{IMD - Rank of average score}{IMD - Rank of average score}
#'   \item{IMD - Proportion of LSOAs in most deprived 10percent nationally}{IMD - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{IMD - Rank of proportion of LSOAs in most deprived 10percent nationally}{IMD - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{IMD 2025 - Extent}{IMD 2025 - Extent}
#'   \item{IMD 2025 - Rank of extent}{IMD 2025 - Rank of extent}
#'   \item{IMD 2025 - Local concentration}{IMD 2025 - Local concentration}
#'   \item{IMD 2025 - Rank of local concentration}{IMD 2025 - Rank of local concentration}
#'   \item{Income - Average rank}{Income - Average rank}
#'   \item{Income - Rank of average rank}{Income - Rank of average rank}
#'   \item{Income - Average score}{Income - Average score}
#'   \item{Income - Rank of average score}{Income - Rank of average score}
#'   \item{Income - Proportion of LSOAs in most deprived 10percent nationally}{Income - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Income - Rank of proportion of LSOAs in most deprived 10percent nationally}{Income - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Income scale}{Income scale}
#'   \item{Rank of Income Scale}{Rank of Income Scale}
#'   \item{Employment - Average rank}{Employment - Average rank}
#'   \item{Employment - Rank of average rank}{Employment - Rank of average rank}
#'   \item{Employment - Average score}{Employment - Average score}
#'   \item{Employment - Rank of average score}{Employment - Rank of average score}
#'   \item{Employment - Proportion of LSOAs in most deprived 10percent nationally}{Employment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Employment - Rank of proportion of LSOAs in most deprived 10percent nationally}{Employment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Employment scale}{Employment scale}
#'   \item{Rank of Employment Scale}{Rank of Employment Scale}
#'   \item{Education, Skills and Training - Average rank}{Education, Skills and Training - Average rank}
#'   \item{Education, Skills and Training - Rank of average rank}{Education, Skills and Training - Rank of average rank}
#'   \item{Education, Skills and Training - Average score}{Education, Skills and Training - Average score}
#'   \item{Education, Skills and Training - Rank of average score}{Education, Skills and Training - Rank of average score}
#'   \item{Education, Skills and Training - Proportion of LSOAs in most deprived 10percent nationally}{Education, Skills and Training - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10percent nationally}{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Health Deprivation and Disability - Average rank}{Health Deprivation and Disability - Average rank}
#'   \item{Health Deprivation and Disability - Rank of average rank}{Health Deprivation and Disability - Rank of average rank}
#'   \item{Health Deprivation and Disability - Average score}{Health Deprivation and Disability - Average score}
#'   \item{Health Deprivation and Disability - Rank of average score}{Health Deprivation and Disability - Rank of average score}
#'   \item{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10percent nationally}{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10percent nationally}{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Crime - Average rank}{Crime - Average rank}
#'   \item{Crime - Rank of average rank}{Crime - Rank of average rank}
#'   \item{Crime - Average score}{Crime - Average score}
#'   \item{Crime - Rank of average score}{Crime - Rank of average score}
#'   \item{Crime - Proportion of LSOAs in most deprived 10percent nationally}{Crime - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Crime - Rank of proportion of LSOAs in most deprived 10percent nationally}{Crime - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Barriers to Housing and Services - Average rank}{Barriers to Housing and Services - Average rank}
#'   \item{Barriers to Housing and Services - Rank of average rank}{Barriers to Housing and Services - Rank of average rank}
#'   \item{Barriers to Housing and Services - Average score}{Barriers to Housing and Services - Average score}
#'   \item{Barriers to Housing and Services - Rank of average score}{Barriers to Housing and Services - Rank of average score}
#'   \item{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10percent nationally}{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10percent nationally}{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Living Environment - Average rank}{Living Environment - Average rank}
#'   \item{Living Environment - Rank of average rank}{Living Environment - Rank of average rank}
#'   \item{Living Environment - Average score}{Living Environment - Average score}
#'   \item{Living Environment - Rank of average score}{Living Environment - Rank of average score}
#'   \item{Living Environment - Proportion of LSOAs in most deprived 10percent nationally}{Living Environment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Living Environment - Rank of proportion of LSOAs in most deprived 10percent nationally}{Living Environment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#' }
#' @source \url{https://www.gov.uk/}
"imd2025_england_icb24"

#' Index of Multiple Deprivation (2025) for LRFs (2024) in England
#'
#' A dataset containing IMD scores, ranks, and related measures for Local Resilience Forums in England.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{lrf24_code}{LRF code}
#'   \item{lrf24_name}{LRF name}
#'   \item{IMD - Average rank}{IMD - Average rank}
#'   \item{IMD - Rank of average rank}{IMD - Rank of average rank}
#'   \item{IMD - Average score}{IMD - Average score}
#'   \item{IMD - Rank of average score}{IMD - Rank of average score}
#'   \item{IMD - Proportion of LSOAs in most deprived 10percent nationally}{IMD - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{IMD - Rank of proportion of LSOAs in most deprived 10percent nationally}{IMD - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{IMD 2025 - Extent}{IMD 2025 - Extent}
#'   \item{IMD 2025 - Rank of extent}{IMD 2025 - Rank of extent}
#'   \item{IMD 2025 - Local concentration}{IMD 2025 - Local concentration}
#'   \item{IMD 2025 - Rank of local concentration}{IMD 2025 - Rank of local concentration}
#'   \item{Income - Average rank}{Income - Average rank}
#'   \item{Income - Rank of average rank}{Income - Rank of average rank}
#'   \item{Income - Average score}{Income - Average score}
#'   \item{Income - Rank of average score}{Income - Rank of average score}
#'   \item{Income - Proportion of LSOAs in most deprived 10percent nationally}{Income - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Income - Rank of proportion of LSOAs in most deprived 10percent nationally}{Income - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Income scale}{Income scale}
#'   \item{Rank of Income Scale}{Rank of Income Scale}
#'   \item{Employment - Average rank}{Employment - Average rank}
#'   \item{Employment - Rank of average rank}{Employment - Rank of average rank}
#'   \item{Employment - Average score}{Employment - Average score}
#'   \item{Employment - Rank of average score}{Employment - Rank of average score}
#'   \item{Employment - Proportion of LSOAs in most deprived 10percent nationally}{Employment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Employment - Rank of proportion of LSOAs in most deprived 10percent nationally}{Employment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Employment scale}{Employment scale}
#'   \item{Rank of Employment Scale}{Rank of Employment Scale}
#'   \item{Education, Skills and Training - Average rank}{Education, Skills and Training - Average rank}
#'   \item{Education, Skills and Training - Rank of average rank}{Education, Skills and Training - Rank of average rank}
#'   \item{Education, Skills and Training - Average score}{Education, Skills and Training - Average score}
#'   \item{Education, Skills and Training - Rank of average score}{Education, Skills and Training - Rank of average score}
#'   \item{Education, Skills and Training - Proportion of LSOAs in most deprived 10percent nationally}{Education, Skills and Training - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10percent nationally}{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Health Deprivation and Disability - Average rank}{Health Deprivation and Disability - Average rank}
#'   \item{Health Deprivation and Disability - Rank of average rank}{Health Deprivation and Disability - Rank of average rank}
#'   \item{Health Deprivation and Disability - Average score}{Health Deprivation and Disability - Average score}
#'   \item{Health Deprivation and Disability - Rank of average score}{Health Deprivation and Disability - Rank of average score}
#'   \item{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10percent nationally}{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10percent nationally}{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Crime - Average rank}{Crime - Average rank}
#'   \item{Crime - Rank of average rank}{Crime - Rank of average rank}
#'   \item{Crime - Average score}{Crime - Average score}
#'   \item{Crime - Rank of average score}{Crime - Rank of average score}
#'   \item{Crime - Proportion of LSOAs in most deprived 10percent nationally}{Crime - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Crime - Rank of proportion of LSOAs in most deprived 10percent nationally}{Crime - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Barriers to Housing and Services - Average rank}{Barriers to Housing and Services - Average rank}
#'   \item{Barriers to Housing and Services - Rank of average rank}{Barriers to Housing and Services - Rank of average rank}
#'   \item{Barriers to Housing and Services - Average score}{Barriers to Housing and Services - Average score}
#'   \item{Barriers to Housing and Services - Rank of average score}{Barriers to Housing and Services - Rank of average score}
#'   \item{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10percent nationally}{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10percent nationally}{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Living Environment - Average rank}{Living Environment - Average rank}
#'   \item{Living Environment - Rank of average rank}{Living Environment - Rank of average rank}
#'   \item{Living Environment - Average score}{Living Environment - Average score}
#'   \item{Living Environment - Rank of average score}{Living Environment - Rank of average score}
#'   \item{Living Environment - Proportion of LSOAs in most deprived 10percent nationally}{Living Environment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{Living Environment - Rank of proportion of LSOAs in most deprived 10percent nationally}{Living Environment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#' }
#' @source \url{https://www.gov.uk/}
"imd2025_england_lrf"

#' Index of Multiple Deprivation (2025) Indicators for LSOAs (2021) in England
#'
#' A dataset containing Index of Multiple Deprivation indicators for Lower Layer Super Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{lsoa21_code}{LSOA 2021 code}
#'   \item{Income Domain numerator}{Income Domain numerator}
#'   \item{Income Deprivation Affecting Children Index (IDACI) numerator}{Income Deprivation Affecting Children Index (IDACI) numerator}
#'   \item{Income Deprivation Affecting Older People Index (IDAOPI) numerator}{Income Deprivation Affecting Older People Index (IDAOPI) numerator}
#'   \item{Employment Domain numerator}{Employment Domain numerator}
#'   \item{Adult skills and English language proficiency indicator}{Adult skills and English language proficiency indicator}
#'   \item{Entry to higher education indicator}{Entry to higher education indicator}
#'   \item{Acute morbidity indicator}{Acute morbidity indicator}
#'   \item{Comparative illness and disability ratio indicator}{Comparative illness and disability ratio indicator}
#'   \item{Mental health indicator}{Mental health indicator}
#'   \item{Years of potential life lost indicator}{Years of potential life lost indicator}
#'   \item{Violence with injury, rate per 1,000 'at-risk population'}{Violence with injury, rate per 1,000 at-risk population}
#'   \item{Violence without injury, rate per 1,000 'at-risk population'}{Violence without injury, rate per 1,000 at-risk population}
#'   \item{Stalking and harassment, rate per 1,000 'at-risk population'}{Stalking and harassment, rate per 1,000 at-risk population}
#'   \item{Burglary, rate per 1,000 'at-risk properties'}{Burglary, rate per 1,000 at-risk properties}
#'   \item{Theft, rate per 1,000 'at-risk population'}{Theft, rate per 1,000 at-risk population}
#'   \item{Criminal damage, rate per 1,000 'at-risk population'}{Criminal damage, rate per 1,000 at-risk population}
#'   \item{Public order and Possession of weapons, rate per 1,000 'at-risk population'}{Public order and Possession of weapons, rate per 1,000 at-risk population}
#'   \item{Anti-Social Behaviour, rate per 1,000 'at-risk population'}{Anti-Social Behaviour, rate per 1,000 at-risk population}
#'   \item{Connectivity Score}{Connectivity Score}
#'   \item{Owner-occupation affordability (component of housing affordability indicator)}{Owner-occupation affordability (component of housing affordability indicator)}
#'   \item{Private rental affordability (component of housing affordability indicator)}{Private rental affordability (component of housing affordability indicator)}
#'   \item{Housing affordability indicator}{Housing affordability indicator}
#'   \item{Digital Connectivity (Broadband download and upload speeds)}{Digital Connectivity (Broadband download and upload speeds)}
#'   \item{Core homelessness rate (percent of households)}{Core homelessness rate (percent of households)}
#'   \item{Patient-to-GP Ratio}{Patient-to-GP Ratio}
#'   \item{Homelessness indicator (rate per 1,000 households)}{Homelessness indicator (rate per 1,000 households)}
#'   \item{Household overcrowding indicator (rooms)}{Household overcrowding indicator (rooms)}
#'   \item{Household overcrowding indicator (bedrooms)}{Household overcrowding indicator (bedrooms)}
#' }
#' @source \url{https://www.gov.uk/}
"imd2025_england_lsoa21_indicators"

#' Index of Multiple Deprivation (2025) Subdomain Scores for LSOAs (2021) in England
#'
#' A dataset containing subdomain scores, ranks, and deciles for Lower-layer Super Output Areas (LSOAs) in England.
#' Subdomains include education (children and young people, adult skills), barriers to housing and services (geographical and wider barriers),
#' and living environment (indoors and outdoors).
#'
#' @format A data frame of class "tbl" with the following columns:
#' \describe{
#'   \item{lsoa21_code}{LSOA 2021 code}
#'   \item{children_and_young_people_score}{Score for the Children and Young People subdomain}
#'   \item{children_and_young_people_rank}{Rank for the Children and Young People subdomain}
#'   \item{children_and_young_people_decile}{Decile for the Children and Young People subdomain}
#'   \item{adult_skills_score}{Score for the Adult Skills subdomain}
#'   \item{adult_skills_rank}{Rank for the Adult Skills subdomain}
#'   \item{adult_skills_decile}{Decile for the Adult Skills subdomain}
#'   \item{geographical_barriers_score}{Score for the Geographical Barriers subdomain}
#'   \item{geographical_barriers_rank}{Rank for the Geographical Barriers subdomain}
#'   \item{geographical_barriers_decile}{Decile for the Geographical Barriers subdomain}
#'   \item{wider_barriers_score}{Score for the Wider Barriers subdomain}
#'   \item{wider_barriers_rank}{Rank for the Wider Barriers subdomain}
#'   \item{wider_barriers_decile}{Decile for the Wider Barriers subdomain}
#'   \item{indoors_score}{Score for the Indoors Living Environment subdomain}
#'   \item{indoors_rank}{Rank for the Indoors Living Environment subdomain}
#'   \item{indoors_decile}{Decile for the Indoors Living Environment subdomain}
#'   \item{outdoors_score}{Score for the Outdoors Living Environment subdomain}
#'   \item{outdoors_rank}{Rank for the Outdoors Living Environment subdomain}
#'   \item{outdoors_decile}{Decile for the Outdoors Living Environment subdomain}
#' }
#' @source \url{https://www.gov.uk/government/statistics/english-indices-of-deprivation-2025}
"imd2025_england_lsoa21_subdomains"


#' Index of Multiple Deprivation for LSOAs (2021) in England
#'
#' A data set containing IMD scores, ranks and deciles for Lower Layer Super
#' Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{lsoa21_code}{LSOA code}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{Housing_and_Access_decile}{Housing and access to services domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{Housing_and_Access_rank}{Housing and access to services domain rank}
#'   \item{Environment_rank}{Environment domain rank}
#'   \item{IMD_score}{IMD score}
#'   \item{Income_score}{Income domain score}
#'   \item{Employment_score}{Employment domain score}
#'   \item{Education_score}{Education domain score}
#'   \item{Health_score}{Health domain score}
#'   \item{Crime_score}{Crime domain score}
#'   \item{Housing_and_Services_score}{Housing and access to services domain score}
#'   \item{Environment_score}{Environment domain score}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2025_england_lsoa21"

#' Index of Multiple Deprivation (2025) for Lower Tier Local Authorities (2024) in England
#'
#' A dataset containing IMD scores, ranks, and subdomain measures for Lower Tier Local Authorities (LTLAs) in England.
#'
#' @format A data frame of class "tbl" with the following columns:
#' \describe{
#'   \item{ltla24_code}{LTLA 2024 code}
#'   \item{ltla24_name}{LTLA 2024 name}
#'   \item{IMD - Average rank}{Population-weighted average IMD rank}
#'   \item{IMD - Rank of average rank}{Rank of the average IMD rank}
#'   \item{IMD - Average score}{Population-weighted average IMD score}
#'   \item{IMD - Rank of average score}{Rank of the average IMD score}
#'   \item{IMD - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally}
#'   \item{IMD - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally}
#'   \item{IMD25 - Extent}{Extent measure for IMD 2025}
#'   \item{IMD25 - Rank of extent}{Rank of extent measure}
#'   \item{IMD25 - Local concentration}{Local concentration measure for IMD 2025}
#'   \item{IMD25 - Rank of local concentration}{Rank of local concentration measure}
#'   \item{Income - Average rank}{Population-weighted average Income rank}
#'   \item{Income - Rank of average rank}{Rank of the average Income rank}
#'   \item{Income - Average score}{Population-weighted average Income score}
#'   \item{Income - Rank of average score}{Rank of the average Income score}
#'   \item{Income - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally for Income}
#'   \item{Income - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally for Income}
#'   \item{Income scale}{Income scale measure}
#'   \item{Rank of Income Scale}{Rank of Income scale measure}
#'   \item{Employment - Average rank}{Population-weighted average Employment rank}
#'   \item{Employment - Rank of average rank}{Rank of the average Employment rank}
#'   \item{Employment - Average score}{Population-weighted average Employment score}
#'   \item{Employment - Rank of average score}{Rank of the average Employment score}
#'   \item{Employment - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally for Employment}
#'   \item{Employment - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally for Employment}
#'   \item{Employment scale}{Employment scale measure}
#'   \item{Rank of Employment Scale}{Rank of Employment scale measure}
#'   \item{Education, Skills and Training - Average rank}{Population-weighted average Education rank}
#'   \item{Education, Skills and Training - Rank of average rank}{Rank of the average Education rank}
#'   \item{Education, Skills and Training - Average score}{Population-weighted average Education score}
#'   \item{Education, Skills and Training - Rank of average score}{Rank of the average Education score}
#'   \item{Education, Skills and Training - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally for Education}
#'   \item{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally for Education}
#'   \item{Health Deprivation and Disability - Average rank}{Population-weighted average Health rank}
#'   \item{Health Deprivation and Disability - Rank of average rank}{Rank of the average Health rank}
#'   \item{Health Deprivation and Disability - Average score}{Population-weighted average Health score}
#'   \item{Health Deprivation and Disability - Rank of average score}{Rank of the average Health score}
#'   \item{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally for Health}
#'   \item{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally for Health}
#'   \item{Crime - Average rank}{Population-weighted average Crime rank}
#'   \item{Crime - Rank of average rank}{Rank of the average Crime rank}
#'   \item{Crime - Average score}{Population-weighted average Crime score}
#'   \item{Crime - Rank of average score}{Rank of the average Crime score}
#'   \item{Crime - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally for Crime}
#'   \item{Crime - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally for Crime}
#'   \item{Barriers to Housing and Services - Average rank}{Population-weighted average Barriers rank}
#'   \item{Barriers to Housing and Services - Rank of average rank}{Rank of the average Barriers rank}
#'   \item{Barriers to Housing and Services - Average score}{Population-weighted average Barriers score}
#'   \item{Barriers to Housing and Services - Rank of average score}{Rank of the average Barriers score}
#'   \item{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally for Barriers}
#'   \item{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally for Barriers}
#'   \item{Living Environment - Average rank}{Population-weighted average Living Environment rank}
#'   \item{Living Environment - Rank of average rank}{Rank of the average Living Environment rank}
#'   \item{Living Environment - Average score}{Population-weighted average Living Environment score}
#'   \item{Living Environment - Rank of average score}{Rank of the average Living Environment score}
#'   \item{Living Environment - Proportion of LSOAs in most deprived 10percent nationally}{Proportion of LSOAs in the most deprived 10 percent nationally for Living Environment}
#'   \item{Living Environment - Rank of proportion of LSOAs in most deprived 10percent nationally}{Rank of proportion of LSOAs in the most deprived 10 percent nationally for Living Environment}
#' }
#' @source \url{https://www.gov.uk/government/statistics/english-indices-of-deprivation-2025}
"imd2025_england_ltla24"

#' Index of Multiple Deprivation for LSOAs (2011) in England
#'
#' A data set containing IMD scores and deciles for Lower Layer Super
#' Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl" with 32,844 rows and 17 variables:
#' \describe{
#'   \item{lsoa11_code}{LSOA code}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{Housing_and_Access_decile}{Housing and access to services domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{Housing_and_Access_rank}{Housing and access to services domain rank}
#'   \item{Environment_rank}{Environment domain rank}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_lsoa11"

#' Index of Multiple Deprivation for LSOAs in Wales
#'
#' A data set containing IMD ranks and deciles for Lower Layer Super
#' Output Areas (LSOAs) in Wales.
#'
#' @format A data frame of class "tbl" with 1,909 rows and 19 variables:
#' \describe{
#'   \item{lsoa11_code}{LSOA code}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{Housing_decile}{Housing domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{Housing_rank}{Housing domain rank}
#'   \item{Access_rank}{Access to services domain rank}
#'   \item{Environment_rank}{Environment domain rank}
#'   ...
#' }
#' @source \url{https://gov.wales/}
"imd2019_wales_lsoa11"

#' Index of Multiple Deprivation for Data Zones in Scotland
#'
#' A data set containing IMD ranks and deciles for Data Zones in Scotland
#'
#' @format A data frame of class "tbl" with 6,976 rows and 17 variables:
#' \describe{
#'   \item{dz11_code}{Data Zone code}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{Housing_decile}{Housing domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{Housing_rank}{Housing domain rank}
#'   \item{Access_rank}{Access to services domain rank}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2020_scotland_dz11"

#' Index of Multiple Deprivation for Super Output Areas in Northern Ireland
#'
#' A data set containing IMD ranks and deciles for SOAs in Northern Ireland.
#'
#' @format A data frame of class "tbl" with 890 rows and 17 variables:
#' \describe{
#'   \item{soa01_code}{Super Output Area code}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Access_rank}{Access to services domain rank}
#'   \item{Environment_rank}{Environment domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"imd2017_northern_ireland_soa01"

#' Index of Multiple Deprivation for MSOAs (2011) in England
#'
#' A data set containing population-weighted average scores, proportions and
#' extents for Middle Layer Super Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl" with 6,791 rows and 25 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Score}{Population-weighted average score for Income domain}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent for Income}
#'   \item{Employment_Score}{Population-weighted average score for Employment
#'     domain}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Employment_Extent}{Extent for Employment}
#'   \item{Education_Score}{Population-weighted average score for Education
#'     domain}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Education_Extent}{Extent for Education}
#'   \item{Health_Score}{Population-weighted average score for Health domain}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent for Health}
#'   \item{Crime_Score}{Population-weighted average score for Crime domain}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent for Crime}
#'   \item{Housing_and_Access_Score}{Population-weighted average score for
#'     Housing/Access domain}
#'   \item{Housing_and_Access_Proportion}{Proportion of most deprived areas
#'     for Housing/Access domain}
#'   \item{Housing_and_Access_Extent}{Extent for Housing/Access}
#'   \item{Environment_Score}{Population-weighted average score for Environment
#'     domain}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for
#'     Environment}
#'   \item{Environment_Extent}{Extent for Environment}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_msoa11"

#' Index of Multiple Deprivation for MSOAs in Wales
#'
#' A data set containing proportions and extents for Middle Layer Super Output
#' Areas (LSOAs) in Wales. Note that IMD scores for Wales are not available.
#'
#' @format A data frame of class "tbl" with 410 rows and 28 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Score}{Population-weighted average income score}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent for Income}
#'   \item{Employment_Score}{Population-weighted average Employment score}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Employment_Extent}{Extent for Employment}
#'   \item{Education_Score}{Population-weighted average Education score}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Education_Extent}{Extent for Education}
#'   \item{Health_Score}{Population-weighted average Health score}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent for Health}
#'   \item{Crime_Score}{Population-weighted average Crime score}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent for Crime}
#'   \item{Housing_Score}{Population-weighted average Housing score}
#'   \item{Housing_Proportion}{Proportion of most deprived areas
#'     for Housing domain}
#'   \item{Housing_Extent}{Extent for Housing}
#'   \item{Access_Score}{Population-weighted average Access score}
#'   \item{Access_Proportion}{Proportion of most deprived areas
#'     for Access domain}
#'   \item{Access_Extent}{Extent for Access}
#'   \item{Environment_Score}{Population-weighted average Environment score}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for
#'     Environment}
#'   \item{Environment_Extent}{Extent for Environment}
#'   ...
#' }
#' @source \url{https://gov.wales/}
"imd2019_wales_msoa11"

#' Index of Multiple Deprivation for IZs in Scotland
#'
#' A data set containing proportions and extents for Intermediate Zones
#' (IZs) in Scotland. Note that IMD scores for Scotland are not available.
#'
#' @format A data frame of class "tbl" with 1,279 rows and 17 variables:
#' \describe{
#'   \item{iz11_code}{Intermediate Zone code}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent for Income}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Employment_Extent}{Extent for Employment}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Education_Extent}{Extent for Education}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent for Health}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent for Crime}
#'   \item{Housing_Proportion}{Proportion of most deprived areas
#'     for Housing domain}
#'   \item{Housing_Extent}{Extent for Housing}
#'   \item{Access_Proportion}{Proportion of most deprived areas
#'     for Access domain}
#'   \item{Access_Extent}{Extent for Access}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2020_scotland_iz11"

#' Index of Multiple Deprivation for Council Areas in Scotland
#'
#' A data set containing proportions and extents for Council Areas (Local
#' Authorities) in Scotland. Note that IMD scores for Scotland are not
#' available.
#'
#' @format A data frame of class "tbl" with 32 rows and 17 variables:
#' \describe{
#'   \item{ltla24_code}{Local Authority code}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent for Income}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Employment_Extent}{Extent for Employment}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Education_Extent}{Extent for Education}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent for Health}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent for Crime}
#'   \item{Housing_Proportion}{Proportion of most deprived areas
#'     for Housing domain}
#'   \item{Housing_Extent}{Extent for Housing}
#'   \item{Access_Proportion}{Proportion of most deprived areas
#'     for Access domain}
#'   \item{Access_Extent}{Extent for Access}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2020_scotland_ltla24"

#' Underlying indicators for Scottish Index of Multiple Deprivation 2020
#' @source \url{https://www.gov.scot/}
"imd2020_scotland_dz11_indicators"

#' Index of Multiple Deprivation for Local Authorities in Wales
#'
#' A data set containing proportions and extents for Local Authorities in
#' Wales. Note that IMD scores for Wales are not available.
#'
#' @format A data frame of class "tbl" with 22 rows and 19 variables:
#' \describe{
#'   \item{lad_code}{LAD code}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent for Income}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Employment_Extent}{Extent for Employment}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Education_Extent}{Extent for Education}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent for Health}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent for Crime}
#'   \item{Housing_Proportion}{Proportion of most deprived areas
#'     for Housing domain}
#'   \item{Housing_Extent}{Extent for Housing}
#'   \item{Access_Proportion}{Proportion of most deprived areas
#'     for Access domain}
#'   \item{Access_Extent}{Extent for Access}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for
#'     Environment}
#'   \item{Environment_Extent}{Extent for Environment}
#'   ...
#' }
#' @source \url{https://gov.wales/}
"imd2019_wales_ltla22"

#' Index of Multiple Deprivation for Local Government Districts in Northern
#' Ireland
#'
#' A data set containing proportions and extents for Local Government Districts
#' (Local Authorities) in Northern Ireland.
#'
#' @format A data frame of class "tbl" with 11 rows and 25 variables:
#' \describe{
#'   \item{lgd14_code}{Local Government District code}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent for Income}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Employment_Extent}{Extent for Employment}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Education_Extent}{Extent for Education}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent for Health}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent for Crime}
#'   \item{Access_Proportion}{Proportion of most deprived areas
#'     for Access domain}
#'   \item{Access_Extent}{Extent for Access}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for
#'     Environment}
#'   \item{Environment_Extent}{Extent for Environment}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"imd2017_northern_ireland_lgd14"

#' Northern Ireland Multiple Deprivation Measure 2017 underlying indicators
#' @source \url{https://www.nisra.gov.uk/}
"imd2017_northern_ireland_soa01_indicators"

#' Index of Multiple Deprivation (2019) for Local Authorities (2019) in England
#'
#' A data set containing aggregated scores and proportions for Local
#' Authorities in England. Note that extents are not available.
#'
#' @format A data frame of class "tbl" with 317 rows and 18 variables:
#' \describe{
#'   \item{ltla19_code}{LAD code}
#'   \item{Score}{Population-weighted average score}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Score}{Population-weighted average score for Income domain}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Employment_Score}{Population-weighted average score for Employment
#'     domain}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Education_Score}{Population-weighted average score for Education
#'     domain}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Health_Score}{Population-weighted average score for Health domain}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Crime_Score}{Population-weighted average score for Crime domain}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Housing_and_Access_Score}{Population-weighted average score for
#'     Housing/Access domain}
#'   \item{Housing_and_Access_Proportion}{Proportion of most deprived areas
#'     for Housing/Access domain}
#'   \item{Environment_Score}{Population-weighted average score for Environment
#'     domain}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for
#'     Environment}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_ltla19"

#' Sub-domains of deprivation for LSOAs (2011) in England
#'
#' A data set containing deprivation sub-domain ranks and deciles for Lower
#' Layer Super Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl" with 32,844 rows and 19 variables:
#' \describe{
#'   \item{lsoa11_code}{LSOA code}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Children_and_young_people_decile}{Children and Young People sub-domain decile}
#'   \item{Adult_skills_decile}{Adult Skills sub-domain decile}
#'   \item{Housing_and_Access_decile}{Housing and access to services domain decile}
#'   \item{Geographical_barriers_decile}{Geographical Barriers sub-domain decile}
#'   \item{Wider_barriers_decile}{Wider Barriers sub-domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   \item{Indoors_decile}{Indoors sub-domain decile}
#'   \item{Outdoors_decile}{Outdoors sub-domain decile}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Children_and_young_people_rank}{Children and Young People sub-domain rank}
#'   \item{Adult_skills_rank}{Adult Skills sub-domain rank}
#'   \item{Housing_and_Access_rank}{Housing and access to services domain rank}
#'   \item{Geographical_barriers_rank}{Geographical Barriers sub-domain rank}
#'   \item{Wider_barriers_rank}{Wider Barriers sub-domain rank}
#'   \item{Environment_rank}{Environment domain rank}
#'   \item{Indoors_rank}{Indoors sub-domain rank}
#'   \item{Outdoors_rank}{Outdoors sub-domain rank}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_lsoa11_subdomains"

#' Sub-domains of deprivation for MSOAs (2011) in England
#'
#' A data set containing deprivation sub-domain ranks and deciles for Middle
#' Layer Super Output Areas (MSOAs) in England.
#'
#' @format A data frame of class "tbl" with 6,791 rows and 13 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{Children_and_young_people_Proportion}{Children and Young People
#'   sub-domain proportion}
#'   \item{Children_and_young_people_Extent}{Children and Young People
#'   sub-domain extent}
#'   \item{Adult_skills_Proportion}{Adult Skills sub-domain proportion}
#'   \item{Adult_skills_Extent}{Adult Skills sub-domain extent}
#'   \item{Geographical_barriers_Proportion}{Geographical Barriers sub-domain
#'   proportion}
#'   \item{Geographical_barriers_Extent}{Geographical Barriers sub-domain
#'   extent}
#'   \item{Wider_barriers_Proportion}{Wider Barriers sub-domain proportion}
#'   \item{Wider_barriers_Extent}{Wider Barriers sub-domain extent}
#'   \item{Indoors_Proportion}{Indoors sub-domain proportion}
#'   \item{Indoors_Extent}{Indoors sub-domain extent}
#'   \item{Outdoors_Proportion}{Outdoors sub-domain proportion}
#'   \item{Outdoors_Extent}{Outdoors sub-domain extent}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_msoa11_subdomains"

#' Sub-domains of deprivation for Local Authorities (2023) in England
#'
#' A data set containing deprivation sub-domain ranks and deciles for Local
#' Authorities in England.
#'
#' @format A data frame of class "tbl" with 317 rows and 13 variables:
#' \describe{
#'   \item{ltla23_code}{Local Authority code}
#'   \item{Children_and_young_people_Proportion}{Children and Young People
#'   sub-domain proportion}
#'   \item{Children_and_young_people_Extent}{Children and Young People
#'   sub-domain extent}
#'   \item{Adult_skills_Proportion}{Adult Skills sub-domain proportion}
#'   \item{Adult_skills_Extent}{Adult Skills sub-domain extent}
#'   \item{Geographical_barriers_Proportion}{Geographical Barriers sub-domain
#'   proportion}
#'   \item{Geographical_barriers_Extent}{Geographical Barriers sub-domain
#'   extent}
#'   \item{Wider_barriers_Proportion}{Wider Barriers sub-domain proportion}
#'   \item{Wider_barriers_Extent}{Wider Barriers sub-domain extent}
#'   \item{Indoors_Proportion}{Indoors sub-domain proportion}
#'   \item{Indoors_Extent}{Indoors sub-domain extent}
#'   \item{Outdoors_Proportion}{Outdoors sub-domain proportion}
#'   \item{Outdoors_Extent}{Outdoors sub-domain extent}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_ltla23_subdomains"

#' Community Needs Index (2019) and Left Behind Areas for Wards (2017 codes) in England
#'
#' A data set containing the Community Needs Index scores and ranks and its
#' three domains. Also highlights which areas are categorised as 'Left Behind'.
#'
#' @format A data frame of class "tbl" with 7433 rows and 13 variables:
#' \describe{
#'   \item{ward17_code}{Ward code}
#'   \item{ward17_name}{Ward name}
#'   \item{lad19_code}{Local Authority code}
#'   \item{lad19_name}{Local Authority name}
#'   \item{Civic Assets score}{Score for the Civic Assets domain (higher score = higher needs)}
#'   \item{Civic Assets rank}{Rank for the Civic Assets domain (1 = highest needs)}
#'   \item{Connectedness score}{Score for the Connectedness domain (higher score = higher needs)}
#'   \item{Connectedness rank}{Rank for the Connectedness domain (1 = highest needs)}
#'   \item{Engaged community score}{Score for the Engaged Community domain (higher score = higher needs)}
#'   \item{Engaged community rank}{Rank for the Engaged Community domain (1 = highest needs)}
#'   \item{Community Needs Index score}{Overall Community Needs Index score (higher score = higher needs)}
#'   \item{Community Needs Index rank}{Overall Community Needs Index rank (1 = highest needs)}
#'   \item{Left Behind Area?}{TRUE if this Ward is a Left Behind Area}
#'   ...
#' }
#' @source \url{https://ocsi.uk/}
"cni2019_england_ward17"

#' Community Needs Index (2023) and Left Behind Areas for LSOAs (2021 codes) in England
#'
#' A data set containing the Community Needs Index scores and ranks and its
#' three domains. Also highlights which areas are categorised as 'Left Behind'.
#'
#' @format A data frame of class "tbl" with 33,755 rows and 11 variables:
#' \describe{
#'   \item{lsoa21_code}{LSOA code}
#'   \item{lsoa21_name}{LSOA name}
#'   \item{Community Needs Index 2023 Score}{Overall Community Needs Index score (higher score = higher needs)}
#'   \item{Community Needs Index 2023 Rank}{Overall Community Needs Index rank (1 = highest needs)}
#'   \item{Civic Assets Domain Score}{Score for the Civic Assets domain (higher score = higher needs)}
#'   \item{Civic Assets Domain Rank}{Rank for the Civic Assets domain (1 = highest needs)}
#'   \item{Connectedness Domain Score}{Score for the Connectedness domain (higher score = higher needs)}
#'   \item{Connectedness Domain Rank}{Rank for the Connectedness domain (1 = highest needs)}
#'   \item{Active and Engaged Community Domain Score}{Score for the Engaged Community domain (higher score = higher needs)}
#'   \item{Engaged and Engaged Community Domain Rank}{Rank for the Engaged Community domain (1 = highest needs)}
#'   \item{Left Behind Area?}{TRUE if this Ward is a Left Behind Area}
#'   ...
#' }
#' @source \url{https://ocsi.uk/}
"cni2023_england_lsoa21"

#' Community Needs Index (2022) and Left Behind Areas for MSOAs (2011 codes) in Wales
#'
#' A data set containing the Community Needs Index scores and ranks and its
#' three domains. Also highlights which areas are categorised as 'Left Behind'.
#'
#' @format A data frame of class "tbl" with 410 rows and 12 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{msoa11_name}{MSOA name}
#'   \item{lad21_name}{Local Authority name}
#'   \item{Civic Assets score}{Score for the Civic Assets domain (higher score = higher needs)}
#'   \item{Civic Assets rank}{Rank for the Civic Assets domain (1 = highest needs)}
#'   \item{Connectedness score}{Score for the Connectedness domain (higher score = higher needs)}
#'   \item{Connectedness rank}{Rank for the Connectedness domain (1 = highest needs)}
#'   \item{Engaged Community score}{Score for the Engaged Community domain (higher score = higher needs)}
#'   \item{Engaged Community rank}{Rank for the Engaged Community domain (1 = highest needs)}
#'   \item{Community Needs Index score}{Overall Community Needs Index score (higher score = higher needs)}
#'   \item{Community Needs Index rank}{Overall Community Needs Index rank (1 = highest needs)}
#'   \item{Left Behind Area?}{TRUE if this Ward is a Left Behind Area}
#'   ...
#' }
#' @source \url{https://ocsi.uk/}
"cni2022_wales_msoa11"

#' Community Needs Index (2022) and Left Behind Areas for Intermediate Zones (2011
#' codes) in Scotland
#'
#' A data set containing the Community Needs Index scores and ranks and its
#' three domains. Also highlights which areas are categorised as 'Left Behind'.
#'
#' @format A data frame of class "tbl" with 1,279 rows and 11 variables:
#' \describe{
#'   \item{iz11_code}{Intermediate Zone code}
#'   \item{iz11_name}{Intermediate Zone name}
#'   \item{Civic Assets score}{Score for the Civic Assets domain (higher score = higher needs)}
#'   \item{Civic Assets rank}{Rank for the Civic Assets domain (1 = highest needs)}
#'   \item{Connectedness score}{Score for the Connectedness domain (higher score = higher needs)}
#'   \item{Connectedness rank}{Rank for the Connectedness domain (1 = highest needs)}
#'   \item{Engaged Community score}{Score for the Engaged Community domain (higher score = higher needs)}
#'   \item{Engaged Community rank}{Rank for the Engaged Community domain (1 = highest needs)}
#'   \item{Community Needs Index score}{Overall Community Needs Index score (higher score = higher needs)}
#'   \item{Community Needs Index rank}{Overall Community Needs Index rank (1 = highest needs)}
#'   \item{Left Behind Area?}{TRUE if this Ward is a Left Behind Area}
#'   ...
#' }
#' @source \url{https://ocsi.uk/}
"cni2022_scotland_iz11"

#' Community Needs Index (2022) and Left Behind Areas for Super Output Areas (2011
#' codes) in Northern Ireland
#'
#' A data set containing the Community Needs Index scores and ranks and its
#' three domains. Also highlights which areas are categorised as 'Left Behind'.
#'
#' @format A data frame of class "tbl" with 890 rows and 13 variables:
#' \describe{
#'   \item{soa11_code}{Super Output Area code}
#'   \item{soa11_name}{Super Output Area name}
#'   \item{lgd14_name}{Local Government District name}
#'   \item{lgd14_code}{Local Government District code}
#'   \item{Civic Assets score}{Score for the Civic Assets domain (higher score = higher needs)}
#'   \item{Civic Assets rank}{Rank for the Civic Assets domain (1 = highest needs)}
#'   \item{Connectedness score}{Score for the Connectedness domain (higher score = higher needs)}
#'   \item{Connectedness rank}{Rank for the Connectedness domain (1 = highest needs)}
#'   \item{Engaged Community score}{Score for the Engaged Community domain (higher score = higher needs)}
#'   \item{Engaged Community rank}{Rank for the Engaged Community domain (1 = highest needs)}
#'   \item{Community Needs Index score}{Overall Community Needs Index score (higher score = higher needs)}
#'   \item{Community Needs Index rank}{Overall Community Needs Index rank (1 = highest needs)}
#'   \item{Left Behind Area?}{TRUE if this Ward is a Left Behind Area}
#'   ...
#' }
#' @source \url{https://ocsi.uk/}
"cni2022_northern_ireland_soa11"

#' Index of Multiple Deprivation (2000) for Wards in England
#'
#' A data set containing IMD scores, ranks and deciles for Wards in England.
#'
#' @format A data frame of class "tbl" with 8,414 rows and 21 variables:
#' \describe{
#'   \item{Ward}{Ward code}
#'   \item{Ward Name}{Ward name}
#'   \item{LA}{Local Authority code}
#'   \item{LA Name}{LA name}
#'   \item{DETR LA Code}{DETR LA code}
#'   \item{Index of Multiple Deprivation Score}{IMD score}
#'   \item{Rank of Index of Multiple Deprivation}{IMD rank}
#'   \item{Income Domain Score}{Income domain score}
#'   \item{Rank of Income Domain}{Income domain rank}
#'   \item{Employment Domain Score}{Employment domain score}
#'   \item{Rank of Employment Domain}{Employment domain rank}
#'   \item{Health Domain Score}{Health domain score}
#'   \item{Rank of Health Domain}{Health domain rank}
#'   \item{Education Domain Score}{Education domain score}
#'   \item{Rank of Education Domain}{Education domain rank}
#'   \item{Housing Domain Score}{Housing domain score}
#'   \item{Rank of Housing Domain}{Housing domain rank}
#'   \item{Access Domain Score}{Access domain score}
#'   \item{Rank of Access Domain}{Access domain rank}
#'   \item{Child Poverty Index Score}{Child Poverty Index score}
#'   \item{Rank of Child Poverty Index}{Child Poverty Index rank}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Health_decile}{Health domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Housing_decile}{Housing domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{Child_Poverty_decile}{Child Poverty Index decile}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2000_england_ward98"

#' Index of Multiple Deprivation (2015) for LSOAs in England
#'
#' A data set containing IMD ranks and deciles for LSOAs in England.
#'
#' @format A data frame of class "tbl" with 32,844 rows and 6 variables:
#' \describe{
#'   \item{lsoa11_code}{LSOA (2011) code}
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lad13_code}{Local Authority (2013) code}
#'   \item{lad13_name}{Local Authority name}
#'   \item{IMD_score}{Index of multiple deprivation score}
#'   \item{IMD_rank}{Index of multiple deprivation rank}
#'   \item{IMD_decile}{Index of multiple deprivation decile}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2015_england_lsoa11"

#' Index of Multiple Deprivation (2015) for Local Authorities in England
#'
#' A data set containing IMD proportions and extents for Local Authorites
#' (2021 codes) in England.
#'
#' @format A data frame of class "tbl" with 309 rows and 3 variables:
#' \describe{
#'   \item{ltla21_code}{Local Authority (2021) code}
#'   \item{Score}{Population-weighted deprivation score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2015_england_ltla21"

#' Index of Multiple Deprivation (2015) for MSOAs in England
#'
#' A data set containing IMD proportions and extents for MSOAs in England.
#'
#' @format A data frame of class "tbl" with 6,791 rows and 3 variables:
#' \describe{
#'   \item{msoa111_code}{MSOA code}
#'   \item{Score}{Population-weighted deprivation score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2015_england_msoa11"

#' Index of Multiple Deprivation (2010) for LSOAs in England
#'
#' A data set containing IMD ranks and deciles for LSOAs in England.
#'
#' @format A data frame of class "tbl" with 32,482 rows and 25 variables:
#' \describe{
#'   \item{lsoa01_code}{LSOA (2001) code}
#'   \item{IMD_score}{Index of multiple deprivation score}
#'   \item{Income_score}{Income domain score}
#'   \item{Employment_score}{Employment domain score}
#'   \item{Health_score}{Health and Disability domain score}
#'   \item{Education_score}{Education domain score}
#'   \item{Housing_and_Access_score}{Barriers to housing and services score}
#'   \item{Crime_score}{Crime domain score}
#'   \item{Environment_score}{Living environment score}
#'   \item{IMD_rank}{Index of multiple deprivation rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Health_rank}{Health and Disability domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Housing_and_Access_rank}{Barriers to housing and services rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{Environment_rank}{Living environment rank}
#'   \item{IMD_decile}{Index of multiple deprivation decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Housing_and_Access_decile}{Barriers to housing and services decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{Environment_decile}{Living environment decile}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2010_england_lsoa01"

#' Index of Multiple Deprivation (2010) for Local Authorities in England
#'
#' A data set containing IMD scores, proportions and extents for Local
#' Authorites (2021 codes) in England.
#'
#' @format A data frame of class "tbl" with 310 rows and 4 variables:
#' \describe{
#'   \item{ltla21_code}{Local Authority (2021) code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2010_england_ltla21"

#' Index of Multiple Deprivation (2010) for MSOA in England
#'
#' A data set containing IMD scores, proportions and extents for Local MSOAs
#' in England.
#'
#' @format A data frame of class "tbl" with 6,791 rows and 4 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2010_england_msoa11"

#' Index of Multiple Deprivation (2019) for Local Authorities (2023 codes) in
#' England
#'
#' A data set containing population-weighted average scores, proportions and
#' extents for Local Authorities (2023 codes) in England.
#'
#' @format A data frame of class "tbl" with 296 rows and 25 variables:
#' \describe{
#'   \item{ltla23_code}{Local Authority (2021) code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Score}{Population-weighted average score for Income domain}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent for Income}
#'   \item{Employment_Score}{Population-weighted average score for Employment
#'     domain}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for
#'     Employment}
#'   \item{Employment_Extent}{Extent for Employment}
#'   \item{Education_Score}{Population-weighted average score for Education
#'     domain}
#'   \item{Education_Proportion}{Proportion of most deprived areas for
#'     Education}
#'   \item{Education_Extent}{Extent for Education}
#'   \item{Health_Score}{Population-weighted average score for Health domain}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent for Health}
#'   \item{Crime_Score}{Population-weighted average score for Crime domain}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent for Crime}
#'   \item{Housing_and_Access_Score}{Population-weighted average score for
#'     Housing/Access domain}
#'   \item{Housing_and_Access_Proportion}{Proportion of most deprived areas
#'     for Housing/Access domain}
#'   \item{Housing_and_Access_Extent}{Extent for Housing/Access}
#'   \item{Environment_Score}{Population-weighted average score for Environment
#'     domain}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for
#'     Environment}
#'   \item{Environment_Extent}{Extent for Environment}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_ltla23"

#' Index of Multiple Deprivation (2007) for LSOAs in England
#'
#' A data set containing IMD scores, ranks and deciles for LSOAs in England.
#'
#' @format A data frame of class "tbl" with 32,482 rows and 6 variables:
#' \describe{
#'   \item{lsoa01_code}{LSOA (2001) code}
#'   \item{lad07_code}{Local Authority (2007) code}
#'   \item{lad07_name}{Local Authority name}
#'   \item{IMD_score}{Index of multiple deprivation score}
#'   \item{IMD_rank}{Index of multiple deprivation rank}
#'   \item{IMD_decile}{Index of multiple deprivation decile}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2007_england_lsoa01"

#' Index of Multiple Deprivation (2007) for Local Authorities in England
#'
#' A data set containing IMD scores, proportions and extents for Local
#' Authorites (2021 codes) in England.
#'
#' @format A data frame of class "tbl" with 309 rows and 4 variables:
#' \describe{
#'   \item{ltla21_code}{Local Authority (2021) code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2007_england_ltla21"

#' Index of Multiple Deprivation (2007) for MSOA in England
#'
#' A data set containing IMD scores, proportions and extents for Local MSOAs
#' in England.
#'
#' @format A data frame of class "tbl" with 6,791 rows and 4 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2007_england_msoa11"

#' Index of Multiple Deprivation (2004) for LSOAs in England
#'
#' A data set containing IMD scores, ranks and deciles for LSOAs in England.
#'
#' @format A data frame of class "tbl" with 32,482 rows and 6 variables:
#' \describe{
#'   \item{lsoa01_code}{LSOA (2001) code}
#'   \item{lad04_code}{Local Authority (2004) code}
#'   \item{lad04_name}{Local Authority name}
#'   \item{IMD_score}{Index of multiple deprivation score}
#'   \item{IMD_rank}{Index of multiple deprivation rank}
#'   \item{IMD_decile}{Index of multiple deprivation decile}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2004_england_lsoa01"

#' Index of Multiple Deprivation (2004) for Local Authorities in England
#'
#' A data set containing IMD scores, proportions and extents for Local
#' Authorites (2021 codes) in England.
#'
#' @format A data frame of class "tbl" with 309 rows and 4 variables:
#' \describe{
#'   \item{ltla21_code}{Local Authority (2021) code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2004_england_ltla21"

#' Index of Multiple Deprivation (2004) for MSOA in England
#'
#' A data set containing IMD scores, proportions and extents for Local MSOAs
#' in England.
#'
#' @format A data frame of class "tbl" with 6,791 rows and 4 variables:
#' \describe{
#'   \item{msoa11_code}{MSOA code}
#'   \item{Score}{Population-weighted average IMD score}
#'   \item{Proportion}{Proportion of the nation's most deprived small areas in each LA}
#'   \item{Extent}{Extent of the LAs population living in the most deprived areas}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2004_england_msoa11"

#' Index of Multiple Deprivation (multiple years) for LAD in UK
#'
#' A data set containing IMD deciles for the UK. Each nation deciled separately.
#'
#' @format A data frame of class "tbl" with 382 rows and 2 variables:
#' \describe{
#'   \item{lad_code}{LAD equivalent code}
#'   \item{IMD Deciles, 1: most deprived, 10: least deprived}{IMD decile}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd_uk_lad"
