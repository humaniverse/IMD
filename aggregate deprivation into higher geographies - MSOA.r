##
## Calculate deprivation in Middle Layer Super Output Areas
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
# GET("https://www.ninis2.nisra.gov.uk/Download/Population/Population%20Totals%20(statistical%20geographies).ods",
#     write_disk(tf <- tempfile(fileext = ".ods")))
# 
# pop_ni = read_ods(tf, sheet = "SOA", skip = 3)
# names(pop_ni)[names(pop_ni) == "Persons"] = as.character(2019:2001)
# 
# unlink(tf); rm(tf)
# 
# pop_ni = pop_ni %>% select(Code = `SOA Code`, `No. people` = `2019`)

# ---- Load LSOA to MSOA lookup ----
lsoa_lad = read_csv("https://opendata.arcgis.com/datasets/fe6c55f0924b4734adf1cf7104a0173e_0.csv")
lsoa_lad = lsoa_lad %>% 
  select(starts_with("LSOA"), starts_with("MSOA")) %>% 
  distinct()

# ---- England ----
eimd = imd_uk %>% 
  filter(str_sub(LSOA, 1, 1) == "E") %>% 
  select(Code = LSOA, IMD_rank, IMD_decile) %>% 
  
  mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
  
  left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop, by = "Code")

# Aggregate intoMSOAs
eimd_msoa = eimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")

# Save
write_csv(eimd_msoa, "data/English IMD - MSOA.csv")  
  
# ---- Wales ----
wimd = imd_uk %>% 
  filter(str_sub(LSOA, 1, 1) == "W") %>% 
  select(Code = LSOA, IMD_rank, IMD_decile) %>% 
  
  mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
  
  left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop, by = "Code")

# Aggregate into MSOAs
wimd_msoa = wimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")

# Save
write_csv(wimd_msoa, "data/Welsh IMD - MSOA.csv")

# ---- Scotland ----
simd = imd_uk %>% 
  filter(str_sub(LSOA, 1, 1) == "S") %>% 
  select(Code = LSOA, IMD_rank, IMD_decile) %>% 
  
  mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
  
  left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop_sco, by = "Code")

# Aggregate into MSOAs (Intermediate Zones)
simd_msoa = simd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")

# Save
write_csv(simd_msoa, "data/Scottish IMD - MSOA.csv")


# ---- Northern Ireland doesn't have MSOAs so do nothing here ----
# nimdm = imd_uk %>% 
#   filter(str_sub(LSOA, 1, 1) == "9") %>% 
#   select(Code = LSOA, IMD_rank, IMD_decile) %>% 
#   
#   mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
#   
#   # left_join(soa_lgd, by = c("Code" = "LSOA11CD")) %>% 
#   left_join(pop_ni, by = "Code")
# 
# # Aggregate into LAs
# nimdm_la = nimdm %>% 
#   aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "LAD19CD")
# 
# # Save
# write_csv(nimdm_la, "data/NI IMD - Local Authorities.csv")
