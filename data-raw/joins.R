# Example data for joins, from dplyr.

library(usethis)
library(dplyr)      # 0.8.5
library(S4Vectors)  # 0.24.3

data(band_members, band_instruments, package = "dplyr")
band_members <- as(band_members, "DataFrame")
band_instruments <- as(band_instruments, "DataFrame")
use_data(band_members, band_instruments, compress = "xz", overwrite = TRUE)
