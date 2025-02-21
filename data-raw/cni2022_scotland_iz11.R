library(readr)
library(usethis)

cni2022_scotland_iz11 <- read_csv("data-raw/cni2022_scotland_iz11.csv")

use_data(cni2022_scotland_iz11, overwrite = TRUE)
