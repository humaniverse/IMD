library(readr)
library(usethis)

cni_england_ward17 <- read_csv("data-raw/community-needs-index-england.csv")

use_data(cni_england_ward17, overwrite = TRUE)
