suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(data.table)
})
load_all()
data(matrix)
data.table <- as.data.table(matrix, keep.rownames = TRUE)
use_data(data.table, compress = "xz", overwrite = TRUE)
