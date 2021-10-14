suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(S4Vectors)
})
load_all()
data(data.frame)
DataFrame <-  # nolint
    DataFrame(data.frame)
use_data(DataFrame, compress = "xz", overwrite = TRUE)
