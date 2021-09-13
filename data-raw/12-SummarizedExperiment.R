suppressPackageStartupMessages({
    library(usethis)
    library(SummarizedExperiment)
})
data(RangedSummarizedExperiment)
SummarizedExperiment <- as(RangedSummarizedExperiment, "SummarizedExperiment")
use_data(SummarizedExperiment, compress = "xz", overwrite = TRUE)
