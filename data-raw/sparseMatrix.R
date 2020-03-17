library(usethis)
library(Matrix)   # 1.2-18
i <- c(1L, 3L:8L)
j <- c(2L, 9L, 6L:10L)
x <- 7 * (1:7)
nrow <- 8L
ncol <- 10L
sparseMatrix <- sparseMatrix(
    i = i,
    j = j,
    x = x,
    dims = c(nrow, ncol),
    dimnames = list(
        sprintf("gene%02d", seq_len(nrow)),
        sprintf("sample%02d", seq_len(ncol))
    )
)
use_data(sparseMatrix, compress = "xz", overwrite = TRUE)
