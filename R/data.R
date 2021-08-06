#' Index of Multiple Deprivation for LSOAs in England
#'
#' A data set containing IMD ranks and deciles for Lower Layer Super
#' Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl" with 32,844 rows and 17 variables:
#' \describe{
#'   \item{lsoa_code}{LSOA code}
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
"imd_england_lsoa"

#' Index of Multiple Deprivation for LSOAs in Wales
#'
#' A data set containing IMD ranks and deciles for Lower Layer Super
#' Output Areas (LSOAs) in Wales.
#'
#' @format A data frame of class "tbl" with 1,909 rows and 19 variables:
#' \describe{
#'   \item{lsoa_code}{LSOA code}
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
#' @source \url{https://www.gov.wales/}
"imd_wales_lsoa"

#' Index of Multiple Deprivation for Data Zones in Scotland
#'
#' A data set containing IMD ranks and deciles for Data Zones in Scotland
#'
#' @format A data frame of class "tbl" with 6,976 rows and 17 variables:
#' \describe{
#'   \item{dz_code}{Data Zone code}
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
"imd_scotland_dz"

#' Index of Multiple Deprivation for Super Output Areas in Northern Ireland
#'
#' A data set containing IMD ranks and deciles for SOAs in Northern Ireland.
#'
#' @format A data frame of class "tbl" with 890 rows and 17 variables:
#' \describe{
#'   \item{soa_code}{Super Output Area code}
#'   \item{IMD_decile}{IMD decile}
#'   \item{Income_decile}{Income domain decile}
#'   \item{Employment_decile}{Employment domain decile}
#'   \item{Education_decile}{Education domain decile}
#'   \item{Health_decile}{Health and Disability domain decile}
#'   \item{Crime_decile}{Crime domain decile}
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
#' @source \url{https://www.nisra.gov.uk/}
"imd_northern_ireland_soa"

#' Index of Multiple Deprivation for MSOAs in England
#'
#' A data set containing IMD ranks and deciles for Middle Layer Super
#' Output Areas (LSOAs) in England.
#'
#' @format A data frame of class "tbl" with 6,791 rows and 25 variables:
#' \describe{
#'   \item{msoa_code}{MSOA code}
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
"imd_england_msoa"

#' Index of Multiple Deprivation for MSOAs in Wales
#'
#' A data set containing IMD ranks and deciles for Middle Layer Super
#' Output Areas (LSOAs) in Wales. Note that IMD scores for Wales are
#' not available.
#'
#' @format A data frame of class "tbl" with 410 rows and 19 variables:
#' \describe{
#'   \item{msoa_code}{MSOA code}
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
#' @source \url{https://www.gov.wales/}
"imd_wales_msoa"

#' Index of Multiple Deprivation for IZs in Scotland
#'
#' A data set containing IMD ranks and deciles for Intermediate Zones
#' (IZs) in Scotland. Note that IMD scores for Scotland are not available.
#'
#' @format A data frame of class "tbl" with 1,279 rows and 17 variables:
#' \describe{
#'   \item{iz_code}{Intermediate Zone code}
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
"imd_scotland_iz"

#' Index of Multiple Deprivation for Council Areas in Scotland
#'
#' A data set containing IMD ranks and deciles for Council Areas (Local
#' Authorities) in Scotland. Note that IMD scores for Scotland are not
#' available.
#'
#' @format A data frame of class "tbl" with 32 rows and 17 variables:
#' \describe{
#'   \item{lad_code}{Local Authority code}
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
"imd_scotland_lad"

#' Index of Multiple Deprivation for Local Authorities in Wales
#'
#' A data set containing IMD ranks and deciles for Local Authorities in Wales.
#' Note that IMD scores for Wales are not available.
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
#' @source \url{https://www.gov.wales/}
"imd_wales_lad"
