##
## Calculate deprivation in Local Authorities
##
library(tidyverse)
library(readxl)
library(httr)

source("functions.r")

imd_uk = read_csv("data/UK IMD domains.csv")

# ---- LSOA population estimates ----
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
