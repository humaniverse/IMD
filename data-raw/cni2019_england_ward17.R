library(readr)
library(usethis)

cni2019_england_ward17 <- read_csv("data-raw/cni2019_england_ward17.csv")

use_data(cni2019_england_ward17, overwrite = TRUE)
