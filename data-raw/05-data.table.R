suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(data.table)
})
load_all()
data(data.frame)
data.table <- # nolint
    as.data.table(data.frame, keep.rownames = TRUE)
use_data(data.table, compress = "xz", overwrite = TRUE)
