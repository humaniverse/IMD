##
## Calculate deprivation in Wards (using 2017 codes) for England and Wales
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

# ---- Load LSOA to ward lookup ----
# Source: https://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-area-2011-to-ward-2017-lookup-in-england-and-wales
lsoa_ward = read_csv("https://opendata.arcgis.com/datasets/500d4283cbe54e3fa7f358399ba3783e_0.csv")
lsoa_ward = lsoa_ward %>% 
  select(starts_with("LSOA"), starts_with("WD")) %>% 
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
  
  left_join(lsoa_ward, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop, by = "Code")

# Aggregate into wards
eimd_ward = eimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")

eimd_ward_income   = eimd %>% aggregate_scores(domain = "Income", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")
eimd_ward_employ   = eimd %>% aggregate_scores(domain = "Employment", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")
eimd_ward_edu      = eimd %>% aggregate_scores(domain = "Education", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")
eimd_ward_health   = eimd %>% aggregate_scores(domain = "Health", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")
eimd_ward_crime    = eimd %>% aggregate_scores(domain = "Crime", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")
eimd_ward_barriers = eimd %>% aggregate_scores(domain = "Housing_and_Access", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")
eimd_ward_env      = eimd %>% aggregate_scores(domain = "Environment", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")

eimd_ward_income   = eimd_ward_income   %>% rename(Income_Proportion = Proportion, Income_Extent = Extent, Income_Score = Score)
eimd_ward_employ   = eimd_ward_employ   %>% rename(Employment_Proportion = Proportion, Employment_Extent = Extent, Employment_Score = Score)
eimd_ward_edu      = eimd_ward_edu      %>% rename(Education_Proportion = Proportion, Education_Extent = Extent, Education_Score = Score)
eimd_ward_health   = eimd_ward_health   %>% rename(Health_Proportion = Proportion, Health_Extent = Extent, Health_Score = Score)
eimd_ward_crime    = eimd_ward_crime    %>% rename(Crime_Proportion = Proportion, Crime_Extent = Extent, Crime_Score = Score)
eimd_ward_barriers = eimd_ward_barriers %>% rename(Housing_and_Access_Proportion = Proportion, Housing_and_Access_Extent = Extent, Housing_and_Access_Score = Score)
eimd_ward_env      = eimd_ward_env      %>% rename(Environment_Proportion = Proportion, Environment_Extent = Extent, Environment_Score = Score)

eimd_ward = eimd_ward %>% 
  left_join(eimd_ward_income,   by = "WD17CD") %>% 
  left_join(eimd_ward_employ,   by = "WD17CD") %>% 
  left_join(eimd_ward_edu,      by = "WD17CD") %>% 
  left_join(eimd_ward_health,   by = "WD17CD") %>% 
  left_join(eimd_ward_crime,    by = "WD17CD") %>% 
  left_join(eimd_ward_barriers, by = "WD17CD") %>% 
  left_join(eimd_ward_env,      by = "WD17CD")

# Save
write_csv(eimd_ward, "data/English IMD - Ward 2017.csv")  

# ---- Wales ----
wimd = imd_uk %>% 
  filter(str_sub(LSOA, 1, 1) == "W") %>% 
  select(Code = LSOA, IMD_rank, IMD_decile) %>% 
  
  mutate(IMD_score = 0) %>%  # don't have IMD scores for Wales so just add a dummy column
  
  left_join(lsoa_ward, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop, by = "Code")

# Aggregate into LAs
wimd_ward = wimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "WD17CD")

# Save
write_csv(wimd_ward, "data/Welsh IMD - Ward 2017.csv")
