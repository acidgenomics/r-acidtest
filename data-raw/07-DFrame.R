suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(S4Vectors)
})
load_all()
data(matrix)
DFrame <- DataFrame(matrix)
use_data(DFrame, compress = "xz", overwrite = TRUE)
