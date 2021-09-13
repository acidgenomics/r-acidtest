suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(SummarizedExperiment)
})
load_all()
data(RangedSummarizedExperiment)
SummarizedExperiment <- as(RangedSummarizedExperiment, "SummarizedExperiment")
use_data(SummarizedExperiment, compress = "xz", overwrite = TRUE)
