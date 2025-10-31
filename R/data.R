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

#' Census 2011 "Households by deprivation" data for Local Government Districtrs in Northern Ireland
#'
#' This dataset provides Census 2011 estimates that classify households in
#' Northern Ireland by four dimensions of deprivation: Employment, education,
#' health and disability, and household overcrowding.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{lgd14_code}{Local Government District code}
#'   \item{households_number_deprivation_dimensions}{The number of dimensions of deprivation}
#'   \item{count}{Number of households}
#'   \item{proportion}{Proportion of households}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"census11_deprivation_northern_ireland_lgd14"

#' Census 2021 "Households by deprivation" data for Local Government Districtrs in Northern Ireland
#'
#' This dataset provides Census 2021 estimates that classify households in
#' Northern Ireland by four dimensions of deprivation: Employment, education,
#' health and disability, and household overcrowding.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{lgd14_code}{Local Government District code}
#'   \item{households_number_deprivation_dimensions}{The number of dimensions of deprivation}
#'   \item{count}{Number of households}
#'   \item{proportion}{Proportion of households}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"census21_deprivation_northern_ireland_lgd14"

#' Census 2021 "Households by deprivation" data for Super Data Zones in Northern Ireland
#'
#' This dataset provides Census 2021 estimates that classify households in
#' Northern Ireland by four dimensions of deprivation: Employment, education,
#' health and disability, and household overcrowding.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{sdz21_code}{Super Data Zone code}
#'   \item{households_number_deprivation_dimensions}{The number of dimensions of deprivation}
#'   \item{count}{Number of households}
#'   \item{proportion}{Proportion of households}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"census21_deprivation_northern_ireland_sdz21"

#' Index of Multiple Deprivation (2025) for ICBs (2024) in England
#'
#' A dataset containing IMD scores, ranks, and related measures for Integrated Care Boards in England.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{icb24_code}{Integrated Care Board Code (2024)}
#'   \item{icb24_name}{Integrated Care Board Name (2024)}
#'   \item{imd_average_rank}{IMD - Average rank}
#'   \item{imd_rank_of_average_rank}{IMD - Rank of average rank}
#'   \item{imd_average_score}{IMD - Average score}
#'   \item{imd_rank_of_average_score}{IMD - Rank of average score}
#'   \item{imd_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{IMD - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{imd_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{IMD - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{imd_2025_extent}{IMD 2025 - Extent}
#'   \item{imd_2025_rank_of_extent}{IMD 2025 - Rank of extent}
#'   \item{imd_2025_local_concentration}{IMD 2025 - Local concentration}
#'   \item{imd_2025_rank_of_local_concentration}{IMD 2025 - Rank of local concentration}
#'   \item{income_average_rank}{Income - Average rank}
#'   \item{income_rank_of_average_rank}{Income - Rank of average rank}
#'   \item{income_average_score}{Income - Average score}
#'   \item{income_rank_of_average_score}{Income - Rank of average score}
#'   \item{income_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Income - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{income_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Income - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{income_scale}{Income scale}
#'   \item{rank_of_income_scale}{Rank of Income Scale}
#'   \item{employment_average_rank}{Employment - Average rank}
#'   \item{employment_rank_of_average_rank}{Employment - Rank of average rank}
#'   \item{employment_average_score}{Employment - Average score}
#'   \item{employment_rank_of_average_score}{Employment - Rank of average score}
#'   \item{employment_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Employment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{employment_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Employment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{employment_scale}{Employment scale}
#'   \item{rank_of_employment_scale}{Rank of Employment Scale}
#'   \item{education_skills_and_training_average_rank}{Education, Skills and Training - Average rank}
#'   \item{education_skills_and_training_rank_of_average_rank}{Education, Skills and Training - Rank of average rank}
#'   \item{education_skills_and_training_average_score}{Education, Skills and Training - Average score}
#'   \item{education_skills_and_training_rank_of_average_score}{Education, Skills and Training - Rank of average score}
#'   \item{education_skills_and_training_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Education, Skills and Training - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{education_skills_and_training_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{health_deprivation_and_disability_average_rank}{Health Deprivation and Disability - Average rank}
#'   \item{health_deprivation_and_disability_rank_of_average_rank}{Health Deprivation and Disability - Rank of average rank}
#'   \item{health_deprivation_and_disability_average_score}{Health Deprivation and Disability - Average score}
#'   \item{health_deprivation_and_disability_rank_of_average_score}{Health Deprivation and Disability - Rank of average score}
#'   \item{health_deprivation_and_disability_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{health_deprivation_and_disability_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{crime_average_rank}{Crime - Average rank}
#'   \item{crime_rank_of_average_rank}{Crime - Rank of average rank}
#'   \item{crime_average_score}{Crime - Average score}
#'   \item{crime_rank_of_average_score}{Crime - Rank of average score}
#'   \item{crime_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Crime - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{crime_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Crime - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{barriers_to_housing_and_services_average_rank}{Barriers to Housing and Services - Average rank}
#'   \item{barriers_to_housing_and_services_rank_of_average_rank}{Barriers to Housing and Services - Rank of average rank}
#'   \item{barriers_to_housing_and_services_average_score}{Barriers to Housing and Services - Average score}
#'   \item{barriers_to_housing_and_services_rank_of_average_score}{Barriers to Housing and Services - Rank of average score}
#'   \item{barriers_to_housing_and_services_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{barriers_to_housing_and_services_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{living_environment_average_rank}{Living Environment - Average rank}
#'   \item{living_environment_rank_of_average_rank}{Living Environment - Rank of average rank}
#'   \item{living_environment_average_score}{Living Environment - Average score}
#'   \item{living_environment_rank_of_average_score}{Living Environment - Rank of average score}
#'   \item{living_environment_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Living Environment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{living_environment_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Living Environment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2025_england_icb24"

#' Index of Multiple Deprivation (2025) for LRFs (2024) in England
#'
#' A dataset containing IMD scores, ranks, and related measures for Local Resilience Forums in England.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{lrf24_code}{Local Resilience Forum Code (2024)}
#'   \item{lrf24_name}{Local Resilience Forum Name (2024)}
#'   \item{imd_average_rank}{IMD - Average rank}
#'   \item{imd_rank_of_average_rank}{IMD - Rank of average rank}
#'   \item{imd_average_score}{IMD - Average score}
#'   \item{imd_rank_of_average_score}{IMD - Rank of average score}
#'   \item{imd_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{IMD - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{imd_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{IMD - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{imd_2025_extent}{IMD 2025 - Extent}
#'   \item{imd_2025_rank_of_extent}{IMD 2025 - Rank of extent}
#'   \item{imd_2025_local_concentration}{IMD 2025 - Local concentration}
#'   \item{imd_2025_rank_of_local_concentration}{IMD 2025 - Rank of local concentration}
#'   \item{income_average_rank}{Income - Average rank}
#'   \item{income_rank_of_average_rank}{Income - Rank of average rank}
#'   \item{income_average_score}{Income - Average score}
#'   \item{income_rank_of_average_score}{Income - Rank of average score}
#'   \item{income_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Income - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{income_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Income - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{income_scale}{Income scale}
#'   \item{rank_of_income_scale}{Rank of Income Scale}
#'   \item{employment_average_rank}{Employment - Average rank}
#'   \item{employment_rank_of_average_rank}{Employment - Rank of average rank}
#'   \item{employment_average_score}{Employment - Average score}
#'   \item{employment_rank_of_average_score}{Employment - Rank of average score}
#'   \item{employment_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Employment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{employment_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Employment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{employment_scale}{Employment scale}
#'   \item{rank_of_employment_scale}{Rank of Employment Scale}
#'   \item{education_skills_and_training_average_rank}{Education, Skills and Training - Average rank}
#'   \item{education_skills_and_training_rank_of_average_rank}{Education, Skills and Training - Rank of average rank}
#'   \item{education_skills_and_training_average_score}{Education, Skills and Training - Average score}
#'   \item{education_skills_and_training_rank_of_average_score}{Education, Skills and Training - Rank of average score}
#'   \item{education_skills_and_training_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Education, Skills and Training - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{education_skills_and_training_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{health_deprivation_and_disability_average_rank}{Health Deprivation and Disability - Average rank}
#'   \item{health_deprivation_and_disability_rank_of_average_rank}{Health Deprivation and Disability - Rank of average rank}
#'   \item{health_deprivation_and_disability_average_score}{Health Deprivation and Disability - Average score}
#'   \item{health_deprivation_and_disability_rank_of_average_score}{Health Deprivation and Disability - Rank of average score}
#'   \item{health_deprivation_and_disability_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{health_deprivation_and_disability_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{crime_average_rank}{Crime - Average rank}
#'   \item{crime_rank_of_average_rank}{Crime - Rank of average rank}
#'   \item{crime_average_score}{Crime - Average score}
#'   \item{crime_rank_of_average_score}{Crime - Rank of average score}
#'   \item{crime_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Crime - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{crime_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Crime - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{barriers_to_housing_and_services_average_rank}{Barriers to Housing and Services - Average rank}
#'   \item{barriers_to_housing_and_services_rank_of_average_rank}{Barriers to Housing and Services - Rank of average rank}
#'   \item{barriers_to_housing_and_services_average_score}{Barriers to Housing and Services - Average score}
#'   \item{barriers_to_housing_and_services_rank_of_average_score}{Barriers to Housing and Services - Rank of average score}
#'   \item{barriers_to_housing_and_services_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{barriers_to_housing_and_services_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{living_environment_average_rank}{Living Environment - Average rank}
#'   \item{living_environment_rank_of_average_rank}{Living Environment - Rank of average rank}
#'   \item{living_environment_average_score}{Living Environment - Average score}
#'   \item{living_environment_rank_of_average_score}{Living Environment - Rank of average score}
#'   \item{living_environment_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Living Environment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{living_environment_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Living Environment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2025_england_lrf"

#' Index of Multiple Deprivation (2025) Indicators for LSOAs (2021) in England
#'
#' A dataset containing Index of Multiple Deprivation indicators for Lower Layer Super Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{lsoa21_code}{LSOA code (2021)}
#'   \item{income_domain_numerator}{Income Domain numerator}
#'   \item{income_deprivation_affecting_children_index_idaci_numerator}{Income Deprivation Affecting Children Index (IDACI) numerator}
#'   \item{income_deprivation_affecting_older_people_index_idaopi_numerator}{Income Deprivation Affecting Older People Index (IDAOPI) numerator}
#'   \item{employment_domain_numerator}{Employment Domain numerator}
#'   \item{adult_skills_and_english_language_proficiency_indicator}{Adult skills and English language proficiency indicator}
#'   \item{entry_to_higher_education_indicator}{Entry to higher education indicator}
#'   \item{acute_morbidity_indicator}{Acute morbidity indicator}
#'   \item{comparative_illness_and_disability_ratio_indicator}{Comparative illness and disability ratio indicator}
#'   \item{mental_health_indicator}{Mental health indicator}
#'   \item{years_of_potential_life_lost_indicator}{Years of potential life lost indicator}
#'   \item{violence_with_injury_rate_per_1_000_at_risk_population}{Violence with injury, rate per 1,000 'at-risk population'}
#'   \item{violence_without_injury_rate_per_1_000_at_risk_population}{Violence without injury, rate per 1,000 'at-risk population'}
#'   \item{stalking_and_harassment_rate_per_1_000_at_risk_population}{Stalking and harassment, rate per 1,000 'at-risk population'}
#'   \item{burglary_rate_per_1_000_at_risk_properties}{Burglary, rate per 1,000 'at-risk properties'}
#'   \item{theft_rate_per_1_000_at_risk_population}{Theft, rate per 1,000 'at-risk population'}
#'   \item{criminal_damage_rate_per_1_000_at_risk_population}{Criminal damage, rate per 1,000 'at-risk population'}
#'   \item{public_order_and_possession_of_weapons_rate_per_1_000_at_risk_population}{Public order and Possession of weapons, rate per 1,000 'at-risk population'}
#'   \item{anti_social_behaviour_rate_per_1_000_at_risk_population}{Anti-Social Behaviour, rate per 1,000 'at-risk population'}
#'   \item{connectivity_score}{Connectivity Score}
#'   \item{owner_occupation_affordability_component_of_housing_affordability_indicator}{Owner-occupation affordability (component of housing affordability indicator)}
#'   \item{private_rental_affordability_component_of_housing_affordability_indicator}{Private rental affordability (component of housing affordability indicator)}
#'   \item{housing_affordability_indicator}{Housing affordability indicator}
#'   \item{digital_connectivity_broadband_download_and_upload_speeds}{Digital Connectivity (Broadband download and upload speeds)}
#'   \item{core_homelessness_rate_percent_of_households}{Core homelessness rate ( percent of households)}
#'   \item{patient_to_gp_ratio}{Patient-to-GP Ratio}
#'   \item{homelessness_indicator_rate_per_1_000_households}{Homelessness indicator (rate per 1,000 households)}
#'   \item{household_overcrowding_indicator_rooms}{Household overcrowding indicator (rooms)}
#'   \item{household_overcrowding_indicator_bedrooms}{Household overcrowding indicator (bedrooms)}
#'   ...
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
#'   ...
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
#'   \item{Housing_and_Services_decile}{Housing and access to services domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{Housing_and_Services_rank}{Housing and access to services domain rank}
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
#'   \item{ltla24_code}{Local Authority District code (2024)}
#'   \item{ltla24_name}{Local Authority District name (2024)}
#'   \item{imd_average_rank}{IMD - Average rank}
#'   \item{imd_rank_of_average_rank}{IMD - Rank of average rank}
#'   \item{imd_average_score}{IMD - Average score}
#'   \item{imd_rank_of_average_score}{IMD - Rank of average score}
#'   \item{imd_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{IMD - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{imd_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{IMD - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{imd25_extent}{IMD25 - Extent}
#'   \item{imd25_rank_of_extent}{IMD25 - Rank of extent}
#'   \item{imd25_local_concentration}{IMD25 - Local concentration}
#'   \item{imd25_rank_of_local_concentration}{IMD25 - Rank of local concentration}
#'   \item{income_average_rank}{Income - Average rank}
#'   \item{income_rank_of_average_rank}{Income - Rank of average rank}
#'   \item{income_average_score}{Income - Average score}
#'   \item{income_rank_of_average_score}{Income - Rank of average score}
#'   \item{income_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Income - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{income_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Income - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{income_scale}{Income scale}
#'   \item{rank_of_income_scale}{Rank of Income Scale}
#'   \item{employment_average_rank}{Employment - Average rank}
#'   \item{employment_rank_of_average_rank}{Employment - Rank of average rank}
#'   \item{employment_average_score}{Employment - Average score}
#'   \item{employment_rank_of_average_score}{Employment - Rank of average score}
#'   \item{employment_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Employment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{employment_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Employment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{employment_scale}{Employment scale}
#'   \item{rank_of_employment_scale}{Rank of Employment Scale}
#'   \item{education_skills_and_training_average_rank}{Education, Skills and Training - Average rank}
#'   \item{education_skills_and_training_rank_of_average_rank}{Education, Skills and Training - Rank of average rank}
#'   \item{education_skills_and_training_average_score}{Education, Skills and Training - Average score}
#'   \item{education_skills_and_training_rank_of_average_score}{Education, Skills and Training - Rank of average score}
#'   \item{education_skills_and_training_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Education, Skills and Training - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{education_skills_and_training_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Education, Skills and Training - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{health_deprivation_and_disability_average_rank}{Health Deprivation and Disability - Average rank}
#'   \item{health_deprivation_and_disability_rank_of_average_rank}{Health Deprivation and Disability - Rank of average rank}
#'   \item{health_deprivation_and_disability_average_score}{Health Deprivation and Disability - Average score}
#'   \item{health_deprivation_and_disability_rank_of_average_score}{Health Deprivation and Disability - Rank of average score}
#'   \item{health_deprivation_and_disability_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Health Deprivation and Disability - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{health_deprivation_and_disability_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Health Deprivation and Disability - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{crime_average_rank}{Crime - Average rank}
#'   \item{crime_rank_of_average_rank}{Crime - Rank of average rank}
#'   \item{crime_average_score}{Crime - Average score}
#'   \item{crime_rank_of_average_score}{Crime - Rank of average score}
#'   \item{crime_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Crime - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{crime_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Crime - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{barriers_to_housing_and_services_average_rank}{Barriers to Housing and Services - Average rank}
#'   \item{barriers_to_housing_and_services_rank_of_average_rank}{Barriers to Housing and Services - Rank of average rank}
#'   \item{barriers_to_housing_and_services_average_score}{Barriers to Housing and Services - Average score}
#'   \item{barriers_to_housing_and_services_rank_of_average_score}{Barriers to Housing and Services - Rank of average score}
#'   \item{barriers_to_housing_and_services_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Barriers to Housing and Services - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{barriers_to_housing_and_services_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Barriers to Housing and Services - Rank of proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{living_environment_average_rank}{Living Environment - Average rank}
#'   \item{living_environment_rank_of_average_rank}{Living Environment - Rank of average rank}
#'   \item{living_environment_average_score}{Living Environment - Average score}
#'   \item{living_environment_rank_of_average_score}{Living Environment - Rank of average score}
#'   \item{living_environment_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Living Environment - Proportion of LSOAs in most deprived 10 percent nationally}
#'   \item{living_environment_rank_of_proportion_of_lso_as_in_most_deprived_10_percent_nationally}{Living Environment - Rank of proportion of LSOAs in most deprived 10 percent nationally}
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

#' Underlying indicators for Index of Multiple Deprivation for LSOAs (2011) in England
#'
#' A data set containing IMD scores and deciles for Lower Layer Super
#' Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl" with 32,844 rows and 29 variables:
#' \describe{
#'   \item{lsoa11_code}{lsoa11_code}
#'   \item{income_domain_numerator}{Income Domain numerator}
#'   \item{income_deprivation_affecting_children_index_idaci_numerator}{Income Deprivation Affecting Children Index (IDACI) numerator}
#'   \item{income_deprivation_affecting_older_people_index_idaopi_numerator}{Income Deprivation Affecting Older People Index (IDAOPI) numerator}
#'   \item{employment_domain_numerator}{Employment Domain numerator}
#'   \item{staying_on_in_education_post_16_indicator}{Staying on in education post 16 indicator}
#'   \item{entry_to_higher_education_indicator}{Entry to higher education indicator}
#'   \item{adult_skills_and_english_language_proficiency_indicator}{Adult skills and English language proficiency indicator}
#'   \item{years_of_potential_life_lost_indicator}{Years of potential life lost indicator}
#'   \item{comparative_illness_and_disability_ratio_indicator}{Comparative illness and disability ratio indicator}
#'   \item{acute_morbidity_indicator}{Acute morbidity indicator}
#'   \item{mood_and_anxiety_disorders_indicator}{Mood and anxiety disorders indicator}
#'   \item{road_distance_to_a_post_office_indicator_km}{Road distance to a post office indicator (km)}
#'   \item{road_distance_to_a_primary_school_indicator_km}{Road distance to a primary school indicator (km)}
#'   \item{road_distance_to_general_store_or_supermarket_indicator_km}{Road distance to general store or supermarket indicator (km)}
#'   \item{road_distance_to_a_gp_surgery_indicator_km}{Road distance to a GP surgery indicator (km)}
#'   \item{household_overcrowding_indicator}{Household overcrowding indicator}
#'   \item{homelessness_indicator_rate_per_1000_households}{Homelessness indicator (rate per 1000 households)}
#'   \item{owner_occupation_affordability_component_of_housing_affordability_indicator}{Owner-occupation affordability (component of housing affordability indicator)}
#'   \item{private_rental_affordability_component_of_housing_affordability_indicator}{Private rental affordability (component of housing affordability indicator)}
#'   \item{housing_affordability_indicator}{Housing affordability indicator}
#'   \item{housing_in_poor_condition_indicator}{Housing in poor condition indicator}
#'   \item{houses_without_central_heating_indicator}{Houses without central heating indicator}
#'   \item{road_traffic_accidents_indicator}{Road traffic accidents indicator}
#'   \item{nitrogen_dioxide_component_of_air_quality_indicator}{Nitrogen dioxide (component of air quality indicator)}
#'   \item{benzene_component_of_air_quality_indicator}{Benzene (component of air quality indicator)}
#'   \item{sulphur_dioxide_component_of_air_quality_indicator}{Sulphur dioxide (component of air quality indicator)}
#'   \item{particulates_component_of_air_quality_indicator}{Particulates (component of air quality indicator)}
#'   \item{air_quality_indicator}{Air quality indicator}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_lsoa11_indicators"

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
#'   \item{IMD_score}{IMD score}
#'   \item{Income_score}{Income domain score}
#'   \item{Employment_score}{Employment domain score}
#'   \item{Education_score}{Education domain score}
#'   \item{Health_score}{Health domain score}
#'   \item{Crime_score}{Crime domain score}
#'   \item{Housing_score}{Housing domain score}
#'   \item{Access_score}{Access to services domain score}
#'   \item{Environment_score}{Environment domain score}
#'   ...
#' }
#' @source \url{https://www.gov.wales/}
"imd2019_wales_lsoa11"

#' Index of Multiple Deprivation (2011) for LSOAs in Wales
#'
#' A data set containing IMD ranks and deciles for Lower Layer Super
#' Output Areas (LSOAs) in Wales.
#'
#' @format A data frame of class "tbl" with 1,896 rows and 19 variables:
#' \describe{
#'   \item{lsoa01_code}{LSOA code}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{Housing_rank}{Housing domain rank}
#'   \item{Access_rank}{Access to services domain rank}
#'   \item{Environment_rank}{Environment domain rank}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{Housing_decile}{Housing domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   ...
#' }
#' @source \url{https://www.gov.wales/}
"imd2011_wales_lsoa01"

#' Index of Multiple Deprivation (2020) for Data Zones in Scotland
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

#' Index of Multiple Deprivation (2016) for Data Zones in Scotland
#'
#' A data set containing IMD ranks and deciles for Data Zones in Scotland
#'
#' @format A data frame of class "tbl" with 6,976 rows and 17 variables:
#' \describe{
#'   \item{dz11_code}{Data Zone code}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Housing_decile}{Housing domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Housing_rank}{Housing domain rank}
#'   \item{Access_rank}{Access to services domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2016_scotland_dz11"

#' Index of Multiple Deprivation (2012) for Data Zones in Scotland
#'
#' A data set containing IMD ranks and deciles for Data Zones in Scotland
#'
#' @format A data frame of class "tbl" with 6,505 rows and 17 variables:
#' \describe{
#'   \item{dz01_code}{Data Zone code}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Housing_rank}{Housing domain rank}
#'   \item{Access_rank}{Access to services domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{Housing_decile}{Housing domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2012_scotland_dz01"

#' Index of Multiple Deprivation (2017) for Super Output Areas in Northern Ireland
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

#' Index of Multiple Deprivation (2010) for Super Output Areas in Northern Ireland
#'
#' A data set containing IMD ranks and deciles for SOAs in Northern Ireland.
#'
#' @format A data frame of class "tbl" with 890 rows and 17 variables:
#' \describe{
#'   \item{soa01_code}{Super Output Area code}
#'   \item{IMD_rank}{IMD rank}
#'   \item{Income_rank}{Income domain rank}
#'   \item{Employment_rank}{Employment domain rank}
#'   \item{Health_rank}{Health domain rank}
#'   \item{Education_rank}{Education domain rank}
#'   \item{Access_rank}{Access to services domain rank}
#'   \item{Environment_rank}{Environment domain rank}
#'   \item{Crime_rank}{Crime domain rank}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Access_decile}{Access to services domain decile}
#'   \item{Environment_decile}{Environment domain decile}
#'   \item{Crime_decile}{Crime domain decile}
#'   ...
#' }
#' @source \url{https://www.nisra.gov.uk/}
"imd2010_northern_ireland_soa01"

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
#' @source \url{https://www.gov.wales/}
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
#'
#' A data set containing proportions and extents for Council Areas (Local
#' Authorities) in Scotland. Note that IMD scores for Scotland are not
#' available.
#'
#' @format A data frame of class "tbl" with 6,976 rows and 35 variables:
#' \describe{
#'   \item{dz11_code}{Data Zone code}
#'   \item{Total_population}{Total population}
#'   \item{Working_age_population}{Working age population}
#'   \item{Income_rate}{Percentage of people who are income deprived}
#'   \item{Income_count}{Number of people who are income deprived}
#'   \item{Employment_rate}{Percentage of people who are employment deprived}
#'   \item{Employment_count}{Number of people who are employment deprived}
#'   \item{CIF}{Comparative Illness Factor: standardised ratio}
#'   \item{ALCOHOL}{Hospital stays related to alcohol misuse: standardised ratio}
#'   \item{DRUG}{Hospital stays related to drug misuse: standardised ratio}
#'   \item{SMR}{Standardised mortality ratio}
#'   \item{DEPRESS}{Proportion of population being prescribed drugs for anxiety, depression or psychosis}
#'   \item{LBWT}{Proportion of live singleton births of low birth weight}
#'   \item{EMERG}{Emergency stays in hospital: standardised ratio}
#'   \item{Attendance}{School pupil attendance}
#'   \item{Attainment}{Attainment of school leavers}
#'   \item{no_qualifications}{Working age people with no qualifications: standardised ratio}
#'   \item{not_participating}{Proportion of people aged 16-19 not participating in education, employment or training}
#'   \item{University}{Proportion of 17-21 year olds entering university}
#'   \item{drive_petrol}{Average drive time to a petrol station in minutes}
#'   \item{drive_GP}{Average drive time to a GP surgery in minutes}
#'   \item{drive_post}{Average drive time to a post office in minutes}
#'   \item{drive_primary}{Average drive time to a primary school in minutes}
#'   \item{drive_retail}{Average drive time to a retail centre in minutes}
#'   \item{drive_secondary}{Average drive time to a secondary school in minutes}
#'   \item{PT_GP}{Public transport travel time to a GP surgery in minutes}
#'   \item{PT_post}{Public transport travel time to a post office in minutes}
#'   \item{PT_retail}{Public transport travel time to a retail centre in minutes}
#'   \item{Broadband}{Percentage of premises without access to superfast broadband (at least 30Mb/s download speed)}
#'   \item{crime_count}{Number of recorded crimes of violence, sexual offences, domestic housebreaking, vandalism, drugs offences, and common assault}
#'   \item{crime_rate}{Recorded crimes of violence, sexual offences, domestic housebreaking, vandalism, drugs offences, and common assault per 10,000 people}
#'   \item{overcrowded_count}{Number of people in households that are overcrowded}
#'   \item{nocentralheat_count}{Number of people in households without central heating}
#'   \item{overcrowded_rate}{Percentage of people in households that are overcrowded}
#'   \item{nocentralheat_rate}{Percentage of people in households without central heating}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2020_scotland_dz11_indicators"

#' Underlying indicators for Scottish Index of Multiple Deprivation 2016
#'
#' A data set containing proportions and extents for Council Areas (Local
#' Authorities) in Scotland. Note that IMD scores for Scotland are not
#' available.
#'
#' @format A data frame of class "tbl" with 6,976 rows and 34 variables:
#' \describe{
#'   \item{dz11_code}{Data Zone code}
#'   \item{Total_population}{Total population}
#'   \item{Working_age_population_revised}{Working age population}
#'   \item{Income_rate}{Percentage of people who are income deprived}
#'   \item{Income_count}{Number of people who are income deprived}
#'   \item{Employment_rate}{Percentage of people who are employment deprived}
#'   \item{Employment_count}{Number of people who are employment deprived}
#'   \item{CIF}{Comparative Illness Factor: standardised ratio}
#'   \item{ALCOHOL}{Hospital stays related to alcohol misuse: standardised ratio}
#'   \item{DRUG}{Hospital stays related to drug misuse: standardised ratio}
#'   \item{SMR}{Standardised mortality ratio}
#'   \item{DEPRESS}{Proportion of population being prescribed drugs for anxiety, depression or psychosis}
#'   \item{LBWT}{Proportion of live singleton births of low birth weight}
#'   \item{EMERG}{Emergency stays in hospital: standardised ratio}
#'   \item{Attendance}{School pupil attendance}
#'   \item{Attainment}{Attainment of school leavers}
#'   \item{Noquals}{Working age people with no qualifications: standardised ratio}
#'   \item{NEET}{Proportion of people aged 16-19 not in full time education, employment or training}
#'   \item{HESA}{Proportion of 17-21 year olds entering in to full time higher education}
#'   \item{drive_petrol}{Average drive time to a petrol station in minutes}
#'   \item{drive_GP}{Average drive time to a GP surgery in minutes}
#'   \item{drive_PO}{Average drive time to a post office in minutes}
#'   \item{drive_primary}{Average drive time to a primary school in minutes}
#'   \item{drive_retail}{Average drive time to a retail centre in minutes}
#'   \item{drive_secondary}{Average drive time to a secondary school in minutes}
#'   \item{PT_GP}{Public transport travel time to a GP surgery in minutes}
#'   \item{PT_Post}{Public transport travel time to a post office in minutes}
#'   \item{PT_retail}{Public transport travel time to a retail centre in minutes}
#'   \item{crime_count}{Number of recorded crimes of violence, sexual offences, domestic housebreaking, vandalism, drugs offences, and common assault}
#'   \item{crime_rate}{Recorded crimes of violence, sexual offences, domestic housebreaking, vandalism, drugs offences, and common assault per 10,000 people}
#'   \item{overcrowded_count}{Number of people in households that are overcrowded}
#'   \item{nocentralheat_count}{Number of people in households without central heating}
#'   \item{overcrowded_rate}{Percentage of people in households that are overcrowded}
#'   \item{nocentralheat_rate}{Percentage of people in households without central heating}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2016_scotland_dz11_indicators"

#' Underlying indicators for Scottish Index of Multiple Deprivation 2012
#'
#' A data set containing proportions and extents for Council Areas (Local
#' Authorities) in Scotland. Note that IMD scores for Scotland are not
#' available.
#'
#' @format A data frame of class "tbl" with 6,505 rows and 47 variables:
#' \describe{
#'   \item{dz01_code}{dz01_code}
#'   \item{total_population_sape_2010}{Total Population (SAPE 2010)}
#'   \item{income_domain_2012_rank}{Income domain 2012 rank}
#'   \item{income_domain_2012_rate_percent}{Income domain 2012 rate (percent)}
#'   \item{number_of_income_deprived_people_2012}{Number of Income Deprived People 2012}
#'   \item{best_fit_working_age_population_men_16_64_women_16_60_sape_2010}{Best-fit Working Age Population (men 16-64, women 16-60 SAPE 2010)}
#'   \item{employment_domain_2012_rank}{Employment domain 2012 rank}
#'   \item{employment_domain_2012_rate_percent}{Employment domain 2012 rate (percent)}
#'   \item{number_of_employment_deprived_people_2012}{Number of Employment Deprived People 2012}
#'   \item{health_domain_2012_rank}{Health domain 2012 rank}
#'   \item{health_domain_2012_score1}{Health domain 2012 score1}
#'   \item{standardised_mortality_ratio_isd_2007_2010}{Standardised mortality ratio (ISD, 2007-2010)}
#'   \item{comparative_illness_factor_standardised_ratio_dwp_2011_2}{Comparative illness factor: standardised ratio (DWP, 2011)2}
#'   \item{hospital_stays_related_to_alcohol_misuse_standardised_ratio_isd_2007_2010}{Hospital stays related to alcohol misuse: standardised ratio(ISD, 2007-2010)}
#'   \item{hospital_stays_related_to_drug_misuse_standardised_ratio_isd_2007_2010}{Hospital stays related to drug misuse: standardised ratio (ISD, 2007-2010)}
#'   \item{emergency_stays_in_hospital_standardised_ratio_isd_2007_2010}{Emergency stays in hospital: standardised ratio (ISD, 2007-2010)}
#'   \item{estimated_proportion_of_population_being_prescribed_drugs_for_anxiety_depression_or_psychosis_isd_2010}{Estimated proportion of population being prescribed drugs for anxiety, depression or psychosis (ISD, 2010)}
#'   \item{proportion_of_live_singleton_births_of_low_birth_weight_isd_2006_2009}{Proportion of live singleton births of low birth weight(ISD, 2006-2009)}
#'   \item{education_skills_and_training_domain_2012_rank1}{Education, Skills and Training domain 2012 rank1}
#'   \item{education_skills_and_training_domain_2012_score1}{Education, Skills and Training domain 2012 score1}
#'   \item{working_age_people_with_no_qualifications_2001_2}{Working age people with no qualifications (2001)2}
#'   \item{people_aged_16_19_not_in_full_time_education_employment_or_training_rate_school_leavers_2009_10_2010_11_dwp_2010_and_2011}{People aged 16-19 not in full time education, employment or training rate (School Leavers 2009/10-2010-11, DWP 2010 and 2011)}
#'   \item{proportion_of_17_21_year_olds_entering_higher_education_hesa_2008_09_2010_11_3}{Proportion of 17- 21 year olds entering higher education (HESA 2008/09-2010/11)3}
#'   \item{pupil_performance_on_sqa_at_stage_4_sqa_2008_09_2010_11_5}{Pupil Performance on SQA at Stage 4 (SQA, 2008/09-2010/11)5}
#'   \item{school_pupil_absences_scottish_government_2009_10_2010_11_4_5}{School Pupil Absences (Scottish Government, 2009/10-2010/11)4,5}
#'   \item{housing_domain_rank_2004_2006_2009_2012}{Housing domain rank 2004, 2006, 2009 & 2012}
#'   \item{housing_domain_score_2004_2006_2009_2012}{Housing domain score 2004, 2006, 2009 & 2012}
#'   \item{household_population_census_2001}{Household Population (Census, 2001)}
#'   \item{percentage_of_household_population_living_in_households_without_central_heating_census_2001}{Percentage of household population living in households without central heating (Census, 2001)}
#'   \item{percentage_of_household_population_living_in_households_that_are_overcrowded_census_2001}{Percentage of household population living in households that are overcrowded (Census, 2001)}
#'   \item{geographic_access_domain_2012_rank}{Geographic Access domain 2012 rank}
#'   \item{geographic_access_domain_2012_score}{Geographic Access domain 2012 score}
#'   \item{drive_times_sub_domain_2012_rank}{Drive times sub-domain 2012 rank}
#'   \item{public_transport_sub_domain_2012_rank}{Public transport sub-domain 2012 rank}
#'   \item{drive_time_to_gp_2012_mins}{Drive time to GP 2012 (mins)}
#'   \item{drive_time_to_petrol_station_2012_mins}{Drive time to Petrol Station 2012 (mins)}
#'   \item{drive_time_to_post_office_2012_mins}{Drive time to Post Office 2012 (mins)}
#'   \item{drive_time_to_primary_school_2012_mins}{Drive time to Primary School 2012 (mins)}
#'   \item{drive_time_to_secondary_school_2012_mins}{Drive time to Secondary School 2012 (mins)}
#'   \item{drive_time_to_retail_centre_2012_mins}{Drive time to retail centre 2012 (mins)}
#'   \item{public_transport_travel_time_to_gp_2012_mins}{Public transport travel time to GP 2012 (mins)}
#'   \item{public_transport_travel_time_to_post_office_2012_mins}{Public transport travel time to Post Office 2012 (mins)}
#'   \item{public_transport_travel_time_to_retail_centre_2012_mins}{Public transport travel time to retail centre 2012 (mins)}
#'   \item{police_force_area}{Police Force Area}
#'   \item{simd_crime_2012_rank}{SIMD Crime 2012 rank}
#'   \item{simd_crime_2012_count}{SIMD Crime 2012 count}
#'   \item{simd_crimes_per_10_000_total_population}{SIMD Crimes per 10,000 total population}
#'   ...
#' }
#' @source \url{https://www.gov.scot/}
"imd2012_scotland_dz01_indicators"

#' Index of Multiple Deprivation for Local Authorities in Wales
#'
#' A data set containing proportions and extents for Local Authorities in
#' Wales. Note that IMD scores for Wales are not available.
#'
#' @format A data frame of class "tbl" with 22 rows and 28 variables:
#' \describe{
#'   \item{ltla22_code}{LAD code}
#'   \item{Score}{Population-weighted average score}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Score}{Population-weighted average score for Income domain}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent of most deprived areas for Income}
#'   \item{Employment_Score}{Population-weighted average score for Employment domain}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for Employment}
#'   \item{Employment_Extent}{Extent of most deprived areas for Employment}
#'   \item{Education_Score}{Population-weighted average score for Education domain}
#'   \item{Education_Proportion}{Proportion of most deprived areas for Education}
#'   \item{Education_Extent}{Extent of most deprived areas for Education}
#'   \item{Health_Score}{Population-weighted average score for Health domain}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent of most deprived areas for Health}
#'   \item{Crime_Score}{Population-weighted average score for Crime domain}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent of most deprived areas for Crime}
#'   \item{Housing_Score}{Population-weighted average score for Housing domain}
#'   \item{Housing_Proportion}{Proportion of most deprived areas for Housing domain}
#'   \item{Housing_Extent}{Extent of most deprived areas for Housing domain}
#'   \item{Access_Score}{Population-weighted average score for access to services domain}
#'   \item{Access_Proportion}{Proportion of most deprived areas for access to services domain}
#'   \item{Access_Extent}{Extent of most deprived areas for access to services domain}
#'   \item{Environment_Score}{Population-weighted average score for Environment domain}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for Environment}
#'   \item{Environment_Extent}{Extent of most deprived areas for Environment}
#
#'   ...
#' }
#' @source \url{https://www.gov.wales/}
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

#' Index of Multiple Deprivation (2019) for Local Authorities (2022) in England
#'
#' A data set containing aggregated scores and proportions for Local
#' Authorities in England. Note that extents are not available.
#'
#' @format A data frame of class "tbl" with 309 rows and 25 variables:
#' \describe{
#'   \item{ltla22_code}{LAD code}
#'   \item{Score}{Population-weighted average score}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Score}{Population-weighted average score for Income domain}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent of most deprived areas for Income}
#'   \item{Employment_Score}{Population-weighted average score for Employment domain}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for Employment}
#'   \item{Employment_Extent}{Extent of most deprived areas for Employment}
#'   \item{Education_Score}{Population-weighted average score for Education domain}
#'   \item{Education_Proportion}{Proportion of most deprived areas for Education}
#'   \item{Education_Extent}{Extent of most deprived areas for Education}
#'   \item{Health_Score}{Population-weighted average score for Health domain}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent of most deprived areas for Health}
#'   \item{Crime_Score}{Population-weighted average score for Crime domain}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent of most deprived areas for Crime}
#'   \item{Housing_and_Access_Score}{Population-weighted average score for Housing/Access domain}
#'   \item{Housing_and_Access_Proportion}{Proportion of most deprived areas for Housing/Access domain}
#'   \item{Housing_and_Access_Extent}{Extent of most deprived areas for Housing/Access domain}
#'   \item{Environment_Score}{Population-weighted average score for Environment domain}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for Environment}
#'   \item{Environment_Extent}{Extent of most deprived areas for Environment}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_ltla22"

#' Index of Multiple Deprivation (2019) for Local Authorities (2023) in England
#'
#' A data set containing aggregated scores and proportions for Local
#' Authorities in England. Note that extents are not available.
#'
#' @format A data frame of class "tbl" with 317 rows and 25 variables:
#' \describe{
#'   \item{ltla23_code}{LAD code}
#'   \item{Score}{Population-weighted average score}
#'   \item{Proportion}{Proportion of small areas in the nation's most deprived}
#'   \item{Extent}{Extent for overall IMD}
#'   \item{Income_Score}{Population-weighted average score for Income domain}
#'   \item{Income_Proportion}{Proportion of most deprived areas for Income}
#'   \item{Income_Extent}{Extent of most deprived areas for Income}
#'   \item{Employment_Score}{Population-weighted average score for Employment domain}
#'   \item{Employment_Proportion}{Proportion of most deprived areas for Employment}
#'   \item{Employment_Extent}{Extent of most deprived areas for Employment}
#'   \item{Education_Score}{Population-weighted average score for Education domain}
#'   \item{Education_Proportion}{Proportion of most deprived areas for Education}
#'   \item{Education_Extent}{Extent of most deprived areas for Education}
#'   \item{Health_Score}{Population-weighted average score for Health domain}
#'   \item{Health_Proportion}{Proportion of most deprived areas for Health}
#'   \item{Health_Extent}{Extent of most deprived areas for Health}
#'   \item{Crime_Score}{Population-weighted average score for Crime domain}
#'   \item{Crime_Proportion}{Proportion of most deprived areas for Crime}
#'   \item{Crime_Extent}{Extent of most deprived areas for Crime}
#'   \item{Housing_and_Access_Score}{Population-weighted average score for Housing/Access domain}
#'   \item{Housing_and_Access_Proportion}{Proportion of most deprived areas for Housing/Access domain}
#'   \item{Housing_and_Access_Extent}{Extent of most deprived areas for Housing/Access domain}
#'   \item{Environment_Score}{Population-weighted average score for Environment domain}
#'   \item{Environment_Proportion}{Proportion of most deprived areas for Environment}
#'   \item{Environment_Extent}{Extent of most deprived areas for Environment}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd2019_england_ltla23"

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
#'   \item{Active and Engaged Community Domain Rank}{Rank for the Engaged Community domain (1 = highest needs)}
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
#'   \item{DETR LA code}{DETR LA code}
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
#'   \item{msoa11_code}{MSOA code}
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

#' Index of Multiple Deprivation (multiple years) for LSOAs across the UK
#'
#' A data set containing IMD deciles for the UK. Each nation deciled separately.
#'
#' @format A data frame of class "tbl":
#' \describe{
#'   \item{area_code}{LSOA code or devolved equivalent}
#'   \item{IMD_decile}{IMD decile}
#'   ...
#' }
#' @source \url{https://www.gov.uk/}
"imd_uk_lsoa"
