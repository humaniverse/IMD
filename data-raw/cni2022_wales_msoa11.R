library(readr)
library(usethis)

cni2022_wales_msoa11 <- read_csv("data-raw/cni2022_wales_msoa11.csv")

use_data(cni2022_wales_msoa11, overwrite = TRUE)
