##
## Calculate deprivation in Local Authorities
##
library(tidyverse)
library(readODS)
library(readxl)
library(httr)

source("functions.r")

imd_uk = read_csv("data/UK IMD domains.csv")

# ---- LSOA population estimates for England and Wales ----
GET("https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2flowersuperoutputareamidyearpopulationestimates%2fmid2019sape22dt2/sape22dt2mid2019lsoasyoaestimatesunformatted.zip",
    write_disk(tf <- tempfile(fileext = ".zip")))

unzip(tf, exdir = "data/population")

unlink(tf); rm(tf)

pop = read_excel("data/population/SAPE22DT2-mid-2019-lsoa-syoa-estimates-unformatted.xlsx", sheet = "Mid-2019 Persons", skip = 4)

pop = pop %>% 
  select(Code = `LSOA Code`, `No. people` = `All Ages`)

# ---- Data Zones population estimates for Scotland ----
# source: https://www.opendata.nhs.scot/dataset/population-estimates/resource/c505f490-c201-44bd-abd1-1bd7a64285ee
pop_sco = read_csv("https://www.opendata.nhs.scot/dataset/7f010430-6ce1-4813-b25c-f7f335bdc4dc/resource/c505f490-c201-44bd-abd1-1bd7a64285ee/download/dz2011-pop-est_01092020.csv")

pop_sco = pop_sco %>%
  filter(Year == 2019 & Sex == "All") %>% 
  select(Code = DataZone, `No. people` = AllAges)

# ---- Super Output Area population estimates for NI ----
GET("https://www.ninis2.nisra.gov.uk/Download/Population/Population%20Totals%20(statistical%20geographies).ods",
    write_disk(tf <- tempfile(fileext = ".ods")))

pop_ni = read_ods(tf, sheet = "SOA", skip = 3)
names(pop_ni)[names(pop_ni) == "Persons"] = as.character(2019:2001)

unlink(tf); rm(tf)

pop_ni = pop_ni %>% select(Code = `SOA Code`, `No. people` = `2019`)

# ---- Load LSOA to LAD lookup ----
lsoa_lad = read_csv("https://opendata.arcgis.com/datasets/fe6c55f0924b4734adf1cf7104a0173e_0.csv")
lsoa_lad = lsoa_lad %>% 
  select(starts_with("LSOA"), starts_with("LAD")) %>% 
  distinct()

lad_17_19 = read_csv("https://github.com/britishredcrosssociety/covid-19-vulnerability/raw/master/data/LAD%202017%20to%20LAD%202019%20codes.csv")

lsoa_lad = lsoa_lad %>% 
  left_join(lad_17_19, by = "LAD17CD")

# ---- Small (Output) Area to Local Government Districts for NI ----
# Small Areas (2011) to SOAs to Local Government Districts (December 2018) Lookup with Area Classifications in Northern Ireland
# source: https://geoportal.statistics.gov.uk/datasets/small-areas-2011-to-soas-to-local-government-districts-december-2018-lookup-with-area-classifications-in-northern-ireland
soa_lgd = read_csv("https://opendata.arcgis.com/datasets/096a7ccbc8e244cc972189b2f07a321a_0.csv") 

soa_lgd = soa_lgd %>% 
  select(LSOA11CD, LAD18CD) %>% 
  left_join(lad_17_19, by = c("LAD18CD" = "LAD17CD"))

# ---- England ----
# This isn't strictly needed since LA-level IMD scores are already publicly available
eimd = read_csv("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/845345/File_7_-_All_IoD2019_Scores__Ranks__Deciles_and_Population_Denominators_3.csv") %>% 
  select(Code = `LSOA code (2011)`, 
         LAD19CD = `Local Authority District code (2019)`,
         IMD_score = `Index of Multiple Deprivation (IMD) Score`,
         IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`, 
         IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`, 
         `No. people` = `Total population: mid 2015 (excluding prisoners)`)

# eimd = imd_uk %>% 
#   filter(str_sub(LSOA, 1, 1) == "E") %>% 
#   select(Code = LSOA, IMD_rank, IMD_decile) %>% 
#   
#   mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
#   
#   left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
#   left_join(pop, by = "Code")

# Aggregate into LAs
eimd_la = eimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "LAD19CD")

# Save
write_csv(eimd_la, "data/English IMD - Local Authorities.csv")

# ---- Wales ----
wimd = imd_uk %>% 
  filter(str_sub(LSOA, 1, 1) == "W") %>% 
  select(Code = LSOA, IMD_rank, IMD_decile) %>% 
  
  mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
  
  left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop, by = "Code")

# Aggregate into LAs
wimd_la = wimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "LAD19CD")

# Save
write_csv(wimd_la, "data/Welsh IMD - Local Authorities.csv")

# ---- Scotland ----
simd = imd_uk %>% 
  filter(str_sub(LSOA, 1, 1) == "S") %>% 
  select(Code = LSOA, IMD_rank, IMD_decile) %>% 
  
  mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
  
  left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop_sco, by = "Code")

# Aggregate into LAs
simd_la = simd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "LAD19CD")

# Save
write_csv(simd_la, "data/Scottish IMD - Local Authorities.csv")


# ---- Northern Ireland ----
nimdm = imd_uk %>% 
  filter(str_sub(LSOA, 1, 1) == "9") %>% 
  select(Code = LSOA, IMD_rank, IMD_decile) %>% 
  
  mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
  
  left_join(soa_lgd, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop_ni, by = "Code")

# Aggregate into LAs
nimdm_la = nimdm %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "LAD19CD")

# Save
write_csv(nimdm_la, "data/NI IMD - Local Authorities.csv")
