## nolint start
suppressPackageStartupMessages({
    library(usethis)
})
## nolint end
nrow <- 8L
ncol <- 4L
object <-
    matrix(
        ## nolint start
        data = c(
            -2.00, -1.25, 0.00, 0.25, 0.25, 0.50, 2.00, 4.00,
            2.00, 0.25, -1.25, -2.00, 0.50, 0.25, 4.00, 0.00,
            0.50, 4.00, -1.25, 0.25, 0.00, 0.25, 2.00, -2.00,
            4.00, 0.50, -2.00, 2.00, 0.25, -1.25, 0.25, 0.00
        ),
        ## nolint end
        nrow = nrow,
        ncol = ncol,
        byrow = FALSE,
        dimnames = list(
            sprintf("gene%02d", seq_len(nrow)),
            sprintf("contrast%02d", seq_len(ncol))
        )
    )
matrix_lfc <- object # nolint
use_data(matrix_lfc, compress = "xz", overwrite = TRUE)
