library(tidyverse)
library(devtools)
library(readxl)
library(janitor)
library(compositr)

# Load package
load_all(".")

# Set query url
# query_url <-
#   query_urls |>
#   filter(data_set == "imd2007_lsoa01_england_subdomains") |>
#   pull(query_url)

# Had to download the file and unzip manually
imd2007_education <- read_excel("data-raw/imd2007_england_lsoa01_subdomains.xls", sheet = "Education Skills & Training")
imd2007_barriers <- read_excel("data-raw/imd2007_england_lsoa01_subdomains.xls", sheet = "Barriers to Housing & Services")
imd2007_environment <- read_excel("data-raw/imd2007_england_lsoa01_subdomains.xls", sheet = "Living Environment")

# Select data and calculate ranks and deciles
imd2007_education <-
  imd2007_education |>
  clean_names() |> 
  select(
    lsoa01_code = lsoa_code,
    skills_sub_domain_score,
    children_young_people_sub_domain_score,
    education_skills_and_training_domain_score
  ) |>
  mutate(
    skills_sub_domain_rank = invert_rank(skills_sub_domain_score),
    children_young_people_sub_domain_rank = invert_rank(children_young_people_sub_domain_score),
    education_skills_and_training_domain_rank = invert_rank(education_skills_and_training_domain_score),

    skills_sub_domain_decile = ntile(skills_sub_domain_rank, n = 10),
    children_young_people_sub_domain_decile = ntile(children_young_people_sub_domain_rank, n = 10),
    education_skills_and_training_domain_decile = ntile(education_skills_and_training_domain_rank, n = 10)
  )

imd2007_barriers <-
  imd2007_barriers |>
  clean_names() |> 
  select(
    lsoa01_code = lsoa_code,
    wider_barriers_sub_domain_score,
    geographical_barriers_sub_domain_score,
    barriers_to_housing_and_services_domain_score
  ) |>
  mutate(
    wider_barriers_sub_domain_rank = invert_rank(wider_barriers_sub_domain_score),
    geographical_barriers_sub_domain_rank = invert_rank(geographical_barriers_sub_domain_score),
    barriers_to_housing_and_services_domain_rank = invert_rank(barriers_to_housing_and_services_domain_score),

    wider_barriers_sub_domain_decile = ntile(wider_barriers_sub_domain_rank, n = 10),
    geographical_barriers_sub_domain_decile = ntile(geographical_barriers_sub_domain_rank, n = 10),
    barriers_to_housing_and_services_domain_decile = ntile(barriers_to_housing_and_services_domain_rank, n = 10)
  )

imd2007_environment <- 
  imd2007_environment |>
  clean_names() |> 
  select(
    lsoa01_code = lsoa_code,
    indoors_sub_domain_score = indoors_sub_domain,
    outdoors_sub_domain_score = outdoors_sub_domain,
    living_environment_domain_score = living_environment_domain
  ) |>
  mutate(
    indoors_sub_domain_rank = invert_rank(indoors_sub_domain_score),
    outdoors_sub_domain_rank = invert_rank(outdoors_sub_domain_score),
    living_environment_domain_rank = invert_rank(living_environment_domain_score),

    indoors_sub_domain_rank_decile = ntile(indoors_sub_domain_rank, n = 10),
    outdoors_sub_domain_rank_decile = ntile(outdoors_sub_domain_rank, n = 10),
    living_environment_domain_decile = ntile(living_environment_domain_score, n = 10)
  )

imd2007_england_lsoa01_subdomains <- 
  imd2007_education |> 
  left_join(imd2007_barriers) |> 
  left_join(imd2007_environment)

# Save output to data/ folder
usethis::use_data(imd2007_england_lsoa01_subdomains, overwrite = TRUE)
