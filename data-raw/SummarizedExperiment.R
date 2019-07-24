library(usethis)
library(SummarizedExperiment)
nrow <- 50L
ncol <- 4L
assay <- matrix(
    data = runif(nrow * ncol, 1L, 1e4L),
    nrow = nrow,
    ncol = ncol,
    dimnames = list(
        sprintf("gene%02d", seq_len(nrow)),
        sprintf("sample%02d", seq_len(ncol))
    )
)
assay <- round(assay)
mode(assay) <- "integer"
SummarizedExperiment <- SummarizedExperiment(assays = SimpleList(assay))
use_data(SummarizedExperiment, compress = "xz", overwrite = TRUE)
