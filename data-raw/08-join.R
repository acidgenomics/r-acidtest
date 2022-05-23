## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(dplyr)
    library(S4Vectors)
})
## nolint end
data(
    band_instruments,
    band_members,
    package = "dplyr"
)
join <- list(
    "instruments" = as(band_instruments, "DataFrame"),
    "members" = as(band_members, "DataFrame")
)
use_data(join, compress = "xz", overwrite = TRUE)
