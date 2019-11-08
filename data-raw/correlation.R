suppressPackageStartupMessages(library(SummarizedExperiment))

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



## vector ====
x <- cor[["vector_x"]]
y <- cor[["vector_y"]]

head(x)
head(y)

cor(x = x, y = y)

## matrix ====
x <- cor[["matrix_x"]]
y <- cor[["matrix_y"]]

head(x)
head(y)

cor(x)
correlation(x)

cor(x = c(x), y = c(y))
correlation(x, y)

## SummarizedExperiment ====
x <- cor[["SummarizedExperiment_x"]]
y <- cor[["SummarizedExperiment_y"]]

correlation(x = x, i = 1L, j = 2L)
