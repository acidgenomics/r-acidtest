library(usethis)               # 1.5.1
library(SummarizedExperiment)  # 1.16.1

nrow <- 10L
ncol <- 10L
n <- nrow * ncol
mu <- 4L

cor <- list()

cor[["vector_x"]] <- rnbinom(n = n, mu = mu, size = 1L)
## Add some random noise to the random negative binomial vector.
cor[["vector_y"]] <- jitter(cor[["vector_x"]], factor = 10L)

cor[["matrix_x"]] <- matrix(data = cor[["vector_x"]], nrow = nrow, ncol = ncol)
cor[["matrix_y"]] <- matrix(data = cor[["vector_y"]], nrow = nrow, ncol = ncol)

se1 <- SummarizedExperiment(
    assays = list(
        assay1 = cor[["matrix_x"]],
        assay2 = cor[["matrix_y"]]
    )
)
se2 <- SummarizedExperiment(
    assays = list(
        assay = cor[["matrix_y"]]
    )
)
cor[["SummarizedExperiment_x"]] <- se1
cor[["SummarizedExperiment_y"]] <- se2

correlation <- cor
use_data(correlation, compress = "xz", overwrite = TRUE)
