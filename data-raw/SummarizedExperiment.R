library(SummarizedExperiment)
nrows <- 50L
ncols <- 4L
assay <- matrix(
    data = runif(nrows * ncols, 1L, 1e4L),
    nrow = nrows,
    ncol = ncols,
    dimnames = list(
        sprintf("gene%02d", seq_len(nrows)),
        sprintf("sample%02d", seq_len(ncols))
    )
)
assay <- round(assay)
mode(assay) <- "integer"
SummarizedExperiment <- SummarizedExperiment(assays = SimpleList(assay))
use_data(SummarizedExperiment, compress = "xz", overwrite = TRUE)
