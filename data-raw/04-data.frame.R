suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
})
load_all()
data(matrix)
data.frame <- as.data.frame(matrix)
use_data(data.frame, compress = "xz", overwrite = TRUE)
