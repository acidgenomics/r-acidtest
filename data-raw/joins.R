# Example data for joins, from dplyr.
# Updated 2020-01-28.

library(usethis)    # 1.5.1
library(dplyr)      # 0.8.3
library(S4Vectors)  # 0.24.3

data(band_members, band_instruments, package = "dplyr")
band_members <- as(band_members, "DataFrame")
band_instruments <- as(band_instruments, "DataFrame")
use_data(band_members, band_instruments, compress = "xz", overwrite = TRUE)
