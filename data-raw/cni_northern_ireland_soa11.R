library(readr)
library(usethis)

cni_northern_ireland_soa11 <- read_csv("data-raw/community-needs-index-northern-ireland.csv")

use_data(cni_northern_ireland_soa11, overwrite = TRUE)
