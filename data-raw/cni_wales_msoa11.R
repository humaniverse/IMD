library(readr)
library(usethis)

cni_wales_msoa11 <- read_csv("data-raw/community-needs-index-wales.csv")

use_data(cni_wales_msoa11, overwrite = TRUE)
