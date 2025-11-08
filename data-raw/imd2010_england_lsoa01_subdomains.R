library(tidyverse)
library(devtools)
library(janitor)

# Load package
load_all(".")

# Set query url
query_url <-
  query_urls |>
  filter(data_set == "imd2010_lsoa01_england") |>
  pull(query_url)

imd2010 <- read_csv(query_url)

imd2010_england_lsoa01_subdomains <-
  imd2010 |>
  select(
    lsoa01_code = `LSOA CODE`,
    contains("Sub-domain")
  ) |>
  rename_with(~ str_remove(.x, fixed(" (where 1 is most deprived)"))) |> 
  clean_names() |> 
  mutate(
    indoors_sub_domain_decile = ntile(indoors_sub_domain_rank, n = 10),
    outdoors_sub_domain_decile = ntile(outdoors_sub_domain_rank, n = 10),
    geographical_barriers_sub_domain_decile = ntile(geographical_barriers_sub_domain_rank, n = 10),
    wider_barriers_sub_domain_decile = ntile(wider_barriers_sub_domain_rank, n = 10),
    children_young_people_sub_domain_decile = ntile(children_young_people_sub_domain_rank, n = 10),
    skills_sub_domain_decile = ntile(skills_sub_domain_rank, n = 10)
  )

# Save output to data/ folder
usethis::use_data(imd2010_england_lsoa01_subdomains, overwrite = TRUE)
