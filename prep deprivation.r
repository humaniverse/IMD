##
## Combine each UK nation's IMD data into a single file
## and prep separate shapefiles showing 10% most deprived LSOAs (or equivalents) for each domain of deprivation
##
library(tidyverse)
library(readxl)
library(janitor)
library(rgdal)
library(rmapshaper)
library(spdplyr)
library(Hmisc)

data.dir = "data"

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
## Load IMDs
##
imd_eng = read_excel(file.path(data.dir, "England", "File_2_ID_2015_Domains_of_deprivation.xlsx"), sheet = "ID2015 Domains")
imd_wal = read_excel(file.path(data.dir, "WIMD Ranks and Deciles 2014.xlsx"), sheet = "WIMD 2014 results Eng", skip = 3)
imd_sco = read_excel(file.path(data.dir, "SIMD16 ranks and domain ranks.xlsx"), sheet = "SIMD16 ranks")
imd_ni  = read_excel(file.path(data.dir, "NI_IMD.xls"), sheet = "MDM")

# clean up Wales data
imd_wal = imd_wal %>% 
  janitor::remove_empty_cols() %>% 
  filter(startsWith(`LSOA Code`, "W"))

# clean up NI column names
names(imd_ni) = str_replace(names(imd_ni), "\\n", "")

# names and codes of Scotland's Data Zones (their equivalent of LSOAs)
dz_names = read_excel(file.path(data.dir, "Data zone to intermediate zone, local authority, health board, multi-member ward, Scottish parliamentary constituency.xlsx"),
                      sheet = "SIMD16 DZ look-up data") %>% 
  select(DZ, DZname)

# rename Eng variables
imd_eng = imd_eng %>% 
  rename(IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`,
         Income_decile = `Income Decile (where 1 is most deprived 10% of LSOAs)`, 
         Employment_decile = `Employment Decile (where 1 is most deprived 10% of LSOAs)`, 
         Education_decile = `Education, Skills and Training Decile (where 1 is most deprived 10% of LSOAs)`, 
         Health_decile = `Health Deprivation and Disability Decile (where 1 is most deprived 10% of LSOAs)`, 
         Crime_decile = `Crime Decile (where 1 is most deprived 10% of LSOAs)`, 
         Housing_and_Access_decile = `Barriers to Housing and Services Decile (where 1 is most deprived 10% of LSOAs)`, 
         Environment_decile = `Living Environment Decile (where 1 is most deprived 10% of LSOAs)`,
         
         IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`,
         Income_rank = `Income Rank (where 1 is most deprived)`,
         Employment_rank = `Employment Rank (where 1 is most deprived)`,
         Education_rank = `Education, Skills and Training Rank (where 1 is most deprived)`,
         Health_rank = `Health Deprivation and Disability Rank (where 1 is most deprived)`,
         Crime_rank = `Crime Rank (where 1 is most deprived)`,
         Housing_and_Access_rank = `Barriers to Housing and Services Rank (where 1 is most deprived)`,
         Environment_rank = `Living Environment Rank (where 1 is most deprived)`)

##
## calculate deciles for Scotland and NI - for each domain of deprivation
##
imd_wal = imd_wal %>% 
  mutate(IMD_decile = as.integer(cut2(`WIMD 2014 (r)`, g = 10)), 
         Income_decile = as.integer(cut2(`Income (r)`, g = 10)), 
         Employment_decile = as.integer(cut2(Employment, g = 10)), 
         Health_decile = as.integer(cut2(Health, g = 10)), 
         Education_decile = as.integer(cut2(Education, g = 10)), 
         Housing_decile = as.integer(cut2(Housing, g = 10)), 
         Access_decile = as.integer(cut2(`Access to Services`, g = 10)), 
         Environment_decile = as.integer(cut2(`Physical Environment`, g = 10)),
         Crime_decile = as.integer(cut2(`Community Safety`, g = 10))) %>% 
  
  rename(IMD_rank = `WIMD 2014 (r)`,
         Income_rank = `Income (r)`,
         Employment_rank = Employment,
         Health_rank = Health,
         Education_rank = Education,
         Housing_rank = Housing,
         Access_rank = `Access to Services`,
         Environment_rank = `Physical Environment`,
         Crime_rank = `Community Safety`)

imd_sco = imd_sco %>% 
  mutate(IMD_decile = as.integer(cut2(Overall_SIMD16_rank, g = 10)), 
         Income_decile = as.integer(cut2(Income_domain_2016_rank, g = 10)), 
         Employment_decile = as.integer(cut2(Employment_domain_2016_rank, g = 10)), 
         Health_decile = as.integer(cut2(Health_domain_2016_rank, g = 10)), 
         Education_decile = as.integer(cut2(Education_domain_2016_rank, g = 10)), 
         Housing_decile = as.integer(cut2(Housing_domain_2016_rank, g = 10)), 
         Access_decile = as.integer(cut2(Access_domain_2016_rank, g = 10)), 
         Crime_decile = as.integer(cut2(Crime_domain_2016_rank, g = 10))) %>% 
  
  rename(IMD_rank = Overall_SIMD16_rank,
         Income_rank = Income_domain_2016_rank,
         Employment_rank = Employment_domain_2016_rank,
         Health_rank = Health_domain_2016_rank,
         Education_rank = Education_domain_2016_rank,
         Housing_rank = Housing_domain_2016_rank,
         Access_rank = Access_domain_2016_rank,
         Crime_rank = Crime_domain_2016_rank)

imd_ni = imd_ni %>% 
  mutate(IMD_decile = as.integer(cut2(`Multiple Deprivation Measure Rank (where 1 is most deprived)`, g = 10)), 
         Income_decile = as.integer(cut2(`Income Domain Rank (where 1 is most deprived)`, g = 10)), 
         Employment_decile = as.integer(cut2(`Employment Domain Rank (where 1 is most deprived)`, g = 10)), 
         Health_decile = as.integer(cut2(`Health Deprivation and Disability Domain Rank (where 1 is most deprived)`, g = 10)), 
         Education_decile = as.integer(cut2(`Education, Skills and Training Domain Rank (where 1 is most deprived)`, g = 10)), 
         Access_decile = as.integer(cut2(`Access to Services Domain Rank (where 1 is most deprived)`, g = 10)), 
         Environment_decile = as.integer(cut2(`Living Environment Domain Rank (where 1 is most deprived)`, g = 10)), 
         Crime_decile = as.integer(cut2(`Crime and Disorder Domain Rank (where 1 is most deprived)`, g = 10))) %>%
  
  rename(IMD_rank = `Multiple Deprivation Measure Rank (where 1 is most deprived)`, 
         Income_rank = `Income Domain Rank (where 1 is most deprived)`, 
         Employment_rank = `Employment Domain Rank (where 1 is most deprived)`, 
         Health_rank = `Health Deprivation and Disability Domain Rank (where 1 is most deprived)`, 
         Education_rank = `Education, Skills and Training Domain Rank (where 1 is most deprived)`, 
         Access_rank = `Access to Services Domain Rank (where 1 is most deprived)`, 
         Environment_rank = `Living Environment Domain Rank (where 1 is most deprived)`, 
         Crime_rank = `Crime and Disorder Domain Rank (where 1 is most deprived)`)

##
## rural-urban classifications
## see https://github.com/mattmalcher/IndexOfNeed for details of how these files were created
##
ruc_ew = read_csv(file.path(data.dir, "RUC England Wales - LSOA.csv"))
ruc_sco = read_csv(file.path(data.dir, "RUC Scotland - DZ.csv"))
ruc_ni = read_csv(file.path(data.dir, "RUC Northern Ireland - SOA.csv"))

# dichotomise into rural/urban classifications
ruc_ew = ruc_ew %>% 
  mutate(RUC = ifelse(RUC11CD %in% c("A1", "B1", "C1", "C2"), "Urban", "Rural"))

ruc_sco = ruc_sco %>% 
  mutate(RUC = ifelse(UR8FOLD %in% c("1", "2", "3", "4", "5"), "Urban", "Rural"))

ruc_ni = ruc_ni %>% 
  rename(RUC = `2015 Default Urban/Rural`)

# merge in R/U classifications
imd_eng = imd_eng %>% 
  left_join(ruc_ew %>% select(LSOA11CD, RUC), by = c("LSOA code (2011)" = "LSOA11CD"))

imd_wal = imd_wal %>% 
  left_join(ruc_ew %>% select(LSOA11CD, RUC), by = c("LSOA Code" = "LSOA11CD"))

imd_sco = imd_sco %>% 
  left_join(ruc_sco %>% select(DZ_CODE, RUC), by = c("Data_Zone" = "DZ_CODE"))

imd_ni = imd_ni %>% 
  left_join(ruc_ni %>% select(`SOA Code`, RUC), by = c("SOA2001" = "SOA Code"))

##
## combine into UK-wide IMD dataset
##
imd_uk = bind_rows(
  imd_eng %>% 
    select(LSOA = `LSOA code (2011)`, Name = `LSOA name (2011)`, RUC, ends_with("_decile"), ends_with("_rank")),
  
  imd_wal %>% 
    select(LSOA = `LSOA Code`, Name = `LSOA Name (Eng)`, RUC, ends_with("_decile"), ends_with("_rank")),
  
  imd_sco %>% 
    left_join(dz_names, by = c("Data_Zone" = "DZ")) %>% 
    select(LSOA = Data_Zone, Name = DZname, RUC, ends_with("_decile"), ends_with("_rank")),
  
  imd_ni %>% 
    select(LSOA = SOA2001, Name = SOA2001_name, RUC, ends_with("_decile"), ends_with("_rank"))
)

# save everything
write_csv(imd_uk, file.path(data.dir, "UK IMD domains.csv"))

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
