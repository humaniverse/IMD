library(readr)
library(usethis)

cni2022_northern_ireland_soa11 <- read_csv("data-raw/cni2022_northern_ireland_soa11.csv")

use_data(cni2022_northern_ireland_soa11, overwrite = TRUE)
