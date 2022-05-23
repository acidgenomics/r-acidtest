## nolint start
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(SummarizedExperiment)
})
## nolint end
load_all()
data(RangedSummarizedExperiment)
object <- as(RangedSummarizedExperiment, "SummarizedExperiment")
SummarizedExperiment <- object # nolint
use_data(SummarizedExperiment, compress = "xz", overwrite = TRUE)
