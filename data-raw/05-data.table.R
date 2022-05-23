## nolint start
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(data.table)
})
## nolint end
load_all()
data(data.frame)
object <- as.data.table(data.frame, keep.rownames = TRUE)
data.table <- object # nolint
use_data(data.table, compress = "xz", overwrite = TRUE)
