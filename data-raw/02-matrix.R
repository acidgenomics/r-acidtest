## nolint start
suppressPackageStartupMessages({
    library(usethis)
})
## nolint end
nrow <- 4L
ncol <- 4L
object <-
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
matrix <- object
use_data(matrix, overwrite = TRUE, compress = "xz")
