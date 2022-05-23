## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(Matrix)
})
## nolint end
i <- c(1L, 3L:8L)
j <- c(2L, 9L, 6L:10L)
x <- 7L * (1L:7L)
nrow <- 8L
ncol <- 10L
object <-
    sparseMatrix(
        i = i,
        j = j,
        x = x,
        dims = c(nrow, ncol),
        dimnames = list(
            sprintf("gene%02d", seq_len(nrow)),
            sprintf("sample%02d", seq_len(ncol))
        )
    )
sparseMatrix <- object
use_data(sparseMatrix, compress = "xz", overwrite = TRUE)
