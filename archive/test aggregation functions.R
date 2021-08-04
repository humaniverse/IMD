##
## Test aggregation method
##
library(tidyverse)
library(readxl)
library(httr)

source("functions.r")

# ---- LSOA population estimates for England and Wales ----
GET("https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2flowersuperoutputareamidyearpopulationestimates%2fmid2019sape22dt2/sape22dt2mid2019lsoasyoaestimatesunformatted.zip",
    write_disk(tf <- tempfile(fileext = ".zip")))

unzip(tf, exdir = "data/population")

unlink(tf); rm(tf)

pop = read_excel("data/population/SAPE22DT2-mid-2019-lsoa-syoa-estimates-unformatted.xlsx", sheet = "Mid-2019 Persons", skip = 4)

pop = pop %>% 
  select(Code = `LSOA Code`, `No. people` = `All Ages`)

# ---- Load LSOA to LAD lookup ----
lsoa_lad = read_csv("https://opendata.arcgis.com/datasets/fe6c55f0924b4734adf1cf7104a0173e_0.csv")
lsoa_lad = lsoa_lad %>% 
  select(starts_with("LSOA"), starts_with("LAD")) %>% 
  distinct()

lad_17_19 = read_csv("https://github.com/britishredcrosssociety/covid-19-vulnerability/raw/master/data/LAD%202017%20to%20LAD%202019%20codes.csv")

lsoa_lad = lsoa_lad %>% 
  left_join(lad_17_19, by = "LAD17CD")

# ---- Calculate LA deprivation for England ----
# File 7: all ranks, deciles and scores for the indices of deprivation, and population denominators
# from https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019
eimd_raw = read_csv("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/845345/File_7_-_All_IoD2019_Scores__Ranks__Deciles_and_Population_Denominators_3.csv")

eimd = eimd_raw %>% 
  select(Code = `LSOA code (2011)`, 
         `Total population: mid 2015 (excluding prisoners)`,
         IMD_score = `Index of Multiple Deprivation (IMD) Score`, 
         IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`, 
         IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`) %>% 
  
  left_join(lsoa_lad, by = c("Code" = "LSOA11CD")) %>% 
  left_join(pop, by = "Code")

# Aggregate
eimd_la = eimd %>% 
  aggregate_scores(domain = "IMD", score_suffix = "_score", rank_suffix = "_rank", decile_suffix = "_decile", aggregate_by = "LAD19CD", population_col = "Total population: mid 2015 (excluding prisoners)")

# ---- Load official LA deprivation ----
GET("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/833995/File_10_-_IoD2019_Local_Authority_District_Summaries__lower-tier__.xlsx",
    write_disk(tf <- tempfile(fileext = ".xlsx")))

imd <- read_excel(tf, sheet = "IMD")

unlink(tf); rm(tf)

# ---- Compare ----
imd_comparison = imd %>% 
  select(LAD19CD = `Local Authority District code (2019)`, LAD19NM = `Local Authority District name (2019)`, 
         Score_official_rank = `IMD - Rank of average score`,
         Score_official = `IMD - Average score`, Extent_official = `IMD 2019 - Extent`, Proportion_official = `IMD - Proportion of LSOAs in most deprived 10% nationally`) %>% 
  
  left_join(eimd_la, by = "LAD19CD") %>% 
  
  mutate(Score_rank = 318 - rank(Score))

cor.test(imd_comparison$Score_official, imd_comparison$Score)
cor.test(imd_comparison$Extent_official, imd_comparison$Extent)
cor.test(imd_comparison$Proportion_official, imd_comparison$Proportion)

imd_comparison %>% 
  ggplot(aes(x = Score_official_rank, y = Score_rank)) +
  geom_point() +
  geom_smooth(method = "lm")

imd_comparison %>% 
  ggplot(aes(x = Extent_official, y = Extent)) +
  geom_point() +
  geom_smooth(method = "lm")

imd_comparison %>% 
  ggplot(aes(x = Proportion_official, y = Proportion)) +
  geom_point() +
  geom_smooth(method = "lm")
