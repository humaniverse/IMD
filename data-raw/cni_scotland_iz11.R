library(readr)
library(usethis)

cni_scotland_iz11 <- read_csv("data-raw/community-needs-index-scotland.csv")

use_data(cni_scotland_iz11, overwrite = TRUE)
