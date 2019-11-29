##
## Prepare a shapefile containing all UK Lower Layer Super Output Areas (and devolved nations' equivalents), with deprivation data
##
library(tidyverse)
# library(sf)
library(rgdal)
library(rmapshaper)
library(spdplyr)

data.dir = "data"

##
##
##
imd_uk = read_csv(file.path(data.dir, "UK IMD domains.csv"))

##
## Load LSOAs
##
lsoas = readOGR(dsn = file.path(data.dir, "Boundaries"), 
                layer = "uk_bounds",
                verbose = F)

map_proj = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")  # use this projection for all boundaries

lsoas = spTransform(lsoas, map_proj)

# lsoas = ms_simplify(lsoas)

##
## merge all IMD domains into LSOAs boundaries variable
##
lsoas = lsoas %>% 
  left_join(imd_uk %>% select(-Name), by = "LSOA")

writeOGR(lsoas, data.dir, "IMD in LSOAs", driver="ESRI Shapefile")

##
## make separate boundary variables for each domain, keeping only 10% most deprived LSOAs in each
##
lsoas_imd = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, IMD_decile == 1)$LSOA)

lsoas_income = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Income_decile == 1)$LSOA)

lsoas_employment = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Employment_decile == 1)$LSOA)

lsoas_education = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Education_decile == 1)$LSOA)

lsoas_health = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Health_decile == 1)$LSOA)

lsoas_crime = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Crime_decile == 1)$LSOA)

lsoas_housing_access = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Housing_and_Access_decile == 1)$LSOA)

lsoas_environment = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Environment_decile == 1)$LSOA)

lsoas_housing = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Housing_decile == 1)$LSOA)

lsoas_access = lsoas %>% 
  filter(LSOA %in% subset(imd_uk, Access_decile == 1)$LSOA)

##
## save boundaries for each domain separately
##
save(lsoas_imd, lsoas_income, lsoas_employment, lsoas_education, lsoas_health, lsoas_crime, lsoas_housing_access, lsoas_environment, lsoas_housing, lsoas_access,
     file = "deprivation.RData")

save(lsoas, file = "deprivation - all areas.RData")


###############################################################################
## Descriptive statistics
##
##
## get population sizes, by country, for:
## (i) ten most deprived areas
## (ii) 10% most deprived areas
## (iii) 20% most deprived areas
##
pop = lsoas@data %>% mutate(Country = case_when(
  startsWith(LSOA, "E") ~ "England",
  startsWith(LSOA, "W") ~ "Wales",
  startsWith(LSOA, "S") ~ "Scotland",
  startsWith(LSOA, "9") ~ "Northern Ireland",
  TRUE ~ ""
))

# (i)
pop %>% 
  group_by(Country) %>%
  
  filter(IMD_rank <= 10) %>%  # x% most deprived areas
  
  summarise(sum(People))

# (ii) and (iii)
pop %>% 
  group_by(Country) %>%
  
  filter(IMD_decile <= 2) %>%  # x% most deprived areas
  
  summarise(sum(People))
