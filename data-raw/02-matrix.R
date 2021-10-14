suppressPackageStartupMessages({
    library(usethis)
})
nrow <- 4L
ncol <- 4L
matrix <-
    matrix(
        data = seq(nrow * ncol),
        nrow = nrow,
        ncol = ncol,
        byrow = TRUE,
        dimnames = list(
            sprintf("gene%02d", seq_len(nrow)),
            sprintf("sample%02d", seq_len(ncol))
        )
    )
use_data(matrix, overwrite = TRUE, compress = "xz")
