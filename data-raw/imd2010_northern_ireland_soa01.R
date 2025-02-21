library(tidyverse)

# Load package
devtools::load_all(".")

# Set query url
query_url <-
  query_urls |>
  dplyr::filter(data_set == "imd2010_soa_ni") |>
  dplyr::pull(query_url)

httr::GET(
  query_url,
  httr::write_disk(tf <- tempfile(fileext = ".xls"))
)

# Process each sheet separately
mdm <-
  readxl::read_excel(tf, sheet = "MDM 2010") |>
  select(soa01_code = `SOA CODE`,
         IMD_rank = `Rank of Multiple Deprivation Measure Score (where 1 is most deprived)`)

income <-
  readxl::read_excel(tf, sheet = "Income Deprivation") |>
  select(soa01_code = `SOA CODE`,
         Income_rank = `Rank of Income Domain Score (where 1 is most deprived)`)

employment <-
  readxl::read_excel(tf, sheet = "Employment Deprivation") |>
  select(soa01_code = `SOA CODE`,
         Employment_rank = `Rank of Employment Domain Score (where 1 is most deprived)`)

health <-
  readxl::read_excel(tf, sheet = "Health Deprivation & Disability") |>
  select(soa01_code = `SOA CODE`,
         Health_rank = `Rank of Health Deprivation and Disability Domain Score (where 1 is most deprived)`)

education <-
  readxl::read_excel(tf, sheet = "Education, Skills and Training") |>
  select(soa01_code = `SOA CODE`,
         Education_rank = `Rank of Education, Skills and Training Domain Score (where 1 is most deprived)`)

access <-
  readxl::read_excel(tf, sheet = "Proximity to Services") |>
  select(soa01_code = `SOA CODE`,
         Access_rank = `Rank of Proximity to Services Domain Score (where 1 is most deprived)`)

environment <-
  readxl::read_excel(tf, sheet = "Living Environment") |>
  select(soa01_code = `SOA CODE`,
         Environment_rank = `Rank of Living Environment Domain Score (where 1 is most deprived)`)

crime <-
  readxl::read_excel(tf, sheet = "Crime and Disorder") |>
  select(soa01_code = `SOA CODE`,
         Crime_rank = `Rank of Crime and Disorder Domain Score (where 1 is most deprived)`)

# Join DF
imd2010_northern_ireland_soa01 <- mdm |>
  left_join(income) |>
  left_join(employment) |>
  left_join(health) |>
  left_join(education) |>
  left_join(access) |>
  left_join(environment) |>
  left_join(crime) |>
  mutate(
    IMD_decile = as.integer(Hmisc::cut2(`IMD_rank`, g = 10)),
    Income_decile = as.integer(Hmisc::cut2(`Income_rank`, g = 10)),
    Employment_decile = as.integer(Hmisc::cut2(`Employment_rank`, g = 10)),
    Health_decile = as.integer(Hmisc::cut2(`Health_rank`, g = 10)),
    Education_decile = as.integer(Hmisc::cut2(`Education_rank`, g = 10)),
    Access_decile = as.integer(Hmisc::cut2(`Access_rank`, g = 10)),
    Environment_decile = as.integer(Hmisc::cut2(`Environment_rank`, g = 10)),
    Crime_decile = as.integer(Hmisc::cut2(`Crime_rank`, g = 10))
  )


# Save output to data/ folder
usethis::use_data(imd2010_northern_ireland_soa01, overwrite = TRUE)
