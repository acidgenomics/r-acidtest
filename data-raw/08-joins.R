suppressPackageStartupMessages({
    library(usethis)
    library(dplyr)
    library(S4Vectors)
})
data(band_members, band_instruments, package = "dplyr")
band_members <- as(band_members, "DataFrame")
band_instruments <- as(band_instruments, "DataFrame")
use_data(band_members, band_instruments, compress = "xz", overwrite = TRUE)
