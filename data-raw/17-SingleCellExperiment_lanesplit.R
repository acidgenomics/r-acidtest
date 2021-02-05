## FIXME REWORK THIS.
## FIXME TAKE THE SINGLECELLEXPERIMENT OBJECT AND REWORK THE IDS.
suppressPackageStartupMessages({
    library(usethis)
    library(pryr)
    library(SingleCellExperiment)
    library(basejump)
})
## Restrict to 1 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(1e6, class = "object_size")
data(SingleCellExperiment)
sce <- SingleCellExperiment
stopifnot(
    object_size(sce) < limit,
    identical(dim(sce), c(500L, 100L))
)



## Simulate lane-split single-cell barcodes here.

## FIXME NEED AN AGGREGATE COLUMN TO DEFINE THE MAPPINGS.





## Size checks.
lapply(coerceToList(se), object_size)
object_size(se)
stopifnot(object_size(se) < limit)
validObject(se)
SummarizedExperiment_transcripts <- se
use_data(SummarizedExperiment_transcripts, compress = "xz", overwrite = TRUE)
