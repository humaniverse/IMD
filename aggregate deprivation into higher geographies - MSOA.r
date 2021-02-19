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
# File 7: all ranks, deciles and scores for the indices of deprivation, and population denominators
# from https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019
eimd_raw = read_csv("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/845345/File_7_-_All_IoD2019_Scores__Ranks__Deciles_and_Population_Denominators_3.csv")

eimd = eimd_raw %>% 
  select(Code = `LSOA code (2011)`, 
         
         IMD_score = `Index of Multiple Deprivation (IMD) Score`, 
         IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`, 
         IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`,
         
         Income_score = `Income Score (rate)`,
         Income_rank = `Income Rank (where 1 is most deprived)`,
         Income_decile = `Income Decile (where 1 is most deprived 10% of LSOAs)`, 
         
         Employment_score = `Employment Score (rate)`,
         Employment_rank = `Employment Rank (where 1 is most deprived)`,
         Employment_decile = `Employment Decile (where 1 is most deprived 10% of LSOAs)`, 
         
         Education_score = `Education, Skills and Training Score`,
         Education_rank = `Education, Skills and Training Rank (where 1 is most deprived)`,
         Education_decile = `Education, Skills and Training Decile (where 1 is most deprived 10% of LSOAs)`, 
         
         Health_score = `Health Deprivation and Disability Score`,
         Health_rank = `Health Deprivation and Disability Rank (where 1 is most deprived)`,
         Health_decile = `Health Deprivation and Disability Decile (where 1 is most deprived 10% of LSOAs)`, 
         
         Crime_score = `Crime Score`,
         Crime_rank = `Crime Rank (where 1 is most deprived)`,
         Crime_decile = `Crime Decile (where 1 is most deprived 10% of LSOAs)`, 
         
         Housing_and_Access_score = `Barriers to Housing and Services Score`,
         Housing_and_Access_rank = `Barriers to Housing and Services Rank (where 1 is most deprived)`,
         Housing_and_Access_decile = `Barriers to Housing and Services Decile (where 1 is most deprived 10% of LSOAs)`, 
         
         Environment_score = `Living Environment Score`,
         Environment_rank = `Living Environment Rank (where 1 is most deprived)`,
         Environment_decile = `Living Environment Decile (where 1 is most deprived 10% of LSOAs)`) %>% 
  
  left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop, by = "Code")

# eimd = imd_uk %>% 
#   filter(str_sub(LSOA, 1, 1) == "E") %>% 
#   select(Code = LSOA, IMD_rank, IMD_decile) %>% 
#   
#   mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
#   
#   left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
#   left_join(pop, by = "Code")

# Aggregate intoMSOAs
eimd_msoa = eimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")

eimd_msoa_income   = eimd %>% aggregate_scores(domain = "Income", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")
eimd_msoa_employ   = eimd %>% aggregate_scores(domain = "Employment", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")
eimd_msoa_edu      = eimd %>% aggregate_scores(domain = "Education", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")
eimd_msoa_health   = eimd %>% aggregate_scores(domain = "Health", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")
eimd_msoa_crime    = eimd %>% aggregate_scores(domain = "Crime", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")
eimd_msoa_barriers = eimd %>% aggregate_scores(domain = "Housing_and_Access", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")
eimd_msoa_env      = eimd %>% aggregate_scores(domain = "Environment", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "MSOA11CD")

eimd_msoa_income   = eimd_msoa_income   %>% rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
eimd_msoa_employ   = eimd_msoa_employ   %>% rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
eimd_msoa_edu      = eimd_msoa_edu      %>% rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
eimd_msoa_health   = eimd_msoa_health   %>% rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
eimd_msoa_crime    = eimd_msoa_crime    %>% rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
eimd_msoa_barriers = eimd_msoa_barriers %>% rename(Housing_and_Access_Proportion = Proportion, Housing_and_Access_Extent = Extent, Housing_and_Access_Score = Score)
eimd_msoa_env      = eimd_msoa_env      %>% rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

eimd_msoa = eimd_msoa %>% 
  left_join(eimd_msoa_income,   by = "MSOA11CD") %>% 
  left_join(eimd_msoa_employ,   by = "MSOA11CD") %>% 
  left_join(eimd_msoa_edu,      by = "MSOA11CD") %>% 
  left_join(eimd_msoa_health,   by = "MSOA11CD") %>% 
  left_join(eimd_msoa_crime,    by = "MSOA11CD") %>% 
  left_join(eimd_msoa_barriers, by = "MSOA11CD") %>% 
  left_join(eimd_msoa_env,      by = "MSOA11CD")

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
