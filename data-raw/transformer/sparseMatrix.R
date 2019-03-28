# sparseMatrix
i <- c(1, 3:8)
j <- c(2, 9, 6:10)
x <- 7 * (1:7)
sparseMatrix <- Matrix::sparseMatrix(i = i, j = j, x = x)
save(sparseMatrix, file = file.path("inst", "extdata", "sparseMatrix.rda"))
