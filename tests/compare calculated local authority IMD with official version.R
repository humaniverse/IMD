##
## Check official Local Authority aggregated scores against calculated scores
##
library(tidyverse)
library(readxl)
library(httr)

# ---- Load official LA-level IMD ----
GET("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/833995/File_10_-_IoD2019_Local_Authority_District_Summaries__lower-tier__.xlsx",
    write_disk(tf <- tempfile(fileext = ".xlsx")))

imd_official <- read_excel(tf, sheet = "IMD")

imd_official <- imd_official %>% 
  select(LAD19CD = `Local Authority District code (2019)`, 
         Proportion_official = `IMD - Proportion of LSOAs in most deprived 10% nationally`, 
         Extent_official = `IMD 2019 - Extent`, 
         Score_official = `IMD - Average score`)

unlink(tf); rm(tf)

# ---- Load official LSOA-level IMD ----
eimd <- read_csv("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/845345/File_7_-_All_IoD2019_Scores__Ranks__Deciles_and_Population_Denominators_3.csv") %>% 
  select(Code = `LSOA code (2011)`, 
         LAD19CD = `Local Authority District code (2019)`,
         IMD_score = `Index of Multiple Deprivation (IMD) Score`,
         IMD_rank = `Index of Multiple Deprivation (IMD) Rank (where 1 is most deprived)`, 
         IMD_decile = `Index of Multiple Deprivation (IMD) Decile (where 1 is most deprived 10% of LSOAs)`, 
         `No. people` = `Total population: mid 2015 (excluding prisoners)`)

# ---- Load calculated LA-level IMD ----
imd_calc <- read_csv("data/English IMD - Local Authorities.csv")

# ---- Compare ----
imd <- imd_calc %>% 
  left_join(imd_official, by = "LAD19CD")

# - Score -
imd %>% 
  ggplot(aes(x = Score, y = Score_official)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm")

# - Proportion -
imd %>% 
  ggplot(aes(x = Proportion, y = Proportion_official)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm")

# - Extent -
imd %>% 
  ggplot(aes(x = Extent, y = Extent_official)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm")

imd %>% 
  filter(Extent < 0.2 & Extent_official > 0.4)

imd %>% 
  mutate(Extent_diff = abs(Extent - Extent_official)) %>% 
  arrange(desc(Extent_diff))

eimd %>% 
  filter(LAD19CD == "E09000002")


