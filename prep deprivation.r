##
## Combine each UK nation's Index of Multiple Deprivation data into a single file
##
library(tidyverse)
library(readxl)
library(readODS)
library(janitor)
library(Hmisc)

data.dir = "data"

##
## Load IMD data directly from web
##
# England
tmp_imd_eng = tempfile()
download.file("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/833973/File_2_-_IoD2019_Domains_of_Deprivation.xlsx",
              tmp_imd_eng, mode = "wb")

imd_eng = read_excel(tmp_imd_eng, sheet = "IoD2019 Domains")
unlink(tmp_imd_eng); rm(tmp_imd_eng)

# Wales
tmp_imd_wal = tempfile()
download.file("https://gov.wales/sites/default/files/statistics-and-research/2019-11/welsh-index-multiple-deprivation-2019-index-and-domain-ranks-by-small-area.ods",
              tmp_imd_wal, mode = "wb")

imd_wal = read_ods(tmp_imd_wal, sheet = "WIMD_2019_ranks", skip = 2)
unlink(tmp_imd_wal); rm(tmp_imd_wal)

# Scotland
tmp_imd_sco = tempfile()
download.file("https://www.gov.scot/binaries/content/documents/govscot/publications/statistics/2020/01/scottish-index-of-multiple-deprivation-2020-ranks-and-domain-ranks/documents/scottish-index-of-multiple-deprivation-2020-ranks-and-domain-ranks/scottish-index-of-multiple-deprivation-2020-ranks-and-domain-ranks/govscot%3Adocument/SIMD_2020_Ranks_and_Domain_Ranks.xlsx",
              tmp_imd_sco, mode = "wb")

imd_sco = read_excel(tmp_imd_sco, sheet = "SIMD2020 Ranks")
unlink(tmp_imd_sco); rm(tmp_imd_sco)

# Northern Ireland
tmp_imd_ni = tempfile()
download.file("https://www.nisra.gov.uk/sites/nisra.gov.uk/files/publications/NIMDM17_SOAresults.xls",
              tmp_imd_ni, mode = "wb")

imd_ni = read_excel(tmp_imd_ni, sheet = "MDM")
unlink(tmp_imd_ni); rm(tmp_imd_ni)

##
## Load lookup table(s)
##
# Look-up: Data zone to intermediate zone, local authority, health board, multi-member ward, Scottish parliamentary constituency 
# source: https://www2.gov.scot/Topics/Statistics/SIMD/Look-Up
tmp_sco_lookup = tempfile()
download.file("https://www2.gov.scot/Resource/0053/00534447.xlsx",
              tmp_sco_lookup, mode = "wb")

dz_names = read_excel(tmp_sco_lookup, sheet = "SIMD16 DZ look-up data") %>% 
  select(DZ, DZname) %>% 
  distinct()

unlink(tmp_sco_lookup); rm(tmp_sco_lookup)

##
## Data cleaning
##
# clean up Wales data - only needed if loading from the local file
imd_wal = imd_wal %>%
  janitor::remove_empty("cols") %>%
  filter(startsWith(`LSOA Code`, "W"))

# clean up NI column names - remove newlines
names(imd_ni) = str_replace(names(imd_ni), "\\n", "")

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
  mutate(IMD_decile = as.integer(cut2(`WIMD 2019`, g = 10)), 
         Income_decile = as.integer(cut2(`Income`, g = 10)), 
         Employment_decile = as.integer(cut2(Employment, g = 10)), 
         Health_decile = as.integer(cut2(Health, g = 10)), 
         Education_decile = as.integer(cut2(Education, g = 10)), 
         Housing_decile = as.integer(cut2(Housing, g = 10)), 
         Access_decile = as.integer(cut2(`Access to Services`, g = 10)), 
         Environment_decile = as.integer(cut2(`Physical Environment`, g = 10)),
         Crime_decile = as.integer(cut2(`Community Safety`, g = 10))) %>% 
  
  rename(IMD_rank = `WIMD 2019`,
         Income_rank = `Income`,
         Employment_rank = Employment,
         Health_rank = Health,
         Education_rank = Education,
         Housing_rank = Housing,
         Access_rank = `Access to Services`,
         Environment_rank = `Physical Environment`,
         Crime_rank = `Community Safety`)

imd_sco = imd_sco %>% 
  mutate(IMD_decile = as.integer(cut2(SIMD2020_Rank, g = 10)), 
         Income_decile = as.integer(cut2(SIMD2020_Income_Domain_Rank, g = 10)), 
         Employment_decile = as.integer(cut2(SIMD2020_Employment_Domain_Rank, g = 10)), 
         Health_decile = as.integer(cut2(SIMD2020_Health_Domain_Rank, g = 10)), 
         Education_decile = as.integer(cut2(SIMD2020_Education_Domain_Rank, g = 10)), 
         Housing_decile = as.integer(cut2(SIMD2020_Housing_Domain_Rank, g = 10)), 
         Access_decile = as.integer(cut2(SIMD2020_Access_Domain_Rank, g = 10)), 
         Crime_decile = as.integer(cut2(SIMD2020_Crime_Domain_Rank, g = 10))) %>% 
  
  rename(IMD_rank = SIMD2020_Rank,
         Income_rank = SIMD2020_Income_Domain_Rank,
         Employment_rank = SIMD2020_Employment_Domain_Rank,
         Health_rank = SIMD2020_Health_Domain_Rank,
         Education_rank = SIMD2020_Education_Domain_Rank,
         Housing_rank = SIMD2020_Housing_Domain_Rank,
         Access_rank = SIMD2020_Access_Domain_Rank,
         Crime_rank = SIMD2020_Crime_Domain_Rank)

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
