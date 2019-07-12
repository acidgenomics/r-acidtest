mat <- matrix(
    data = seq(1L:16L),
    nrow = 4L,
    ncol = 4L,
    byrow = FALSE,
    dimnames = list(
        c(
            "ENSG00000000001",
            "ENSG00000000002",
            "ENSG00000000003",
            "ENSG00000000004"
        ),
        paste0("sample", seq_len(4L))
    )
)
sparse <- Matrix::Matrix(mat, sparse = TRUE)
df <- S4Vectors::DataFrame(mat)
dt <- data.table::as.data.table(mat, keep.rownames = TRUE)
tbl <- tibble::as_tibble(mat, rownames = "rowname")
usethis::use_data(mat, sparse, df, dt, tbl, overwrite = TRUE, compress = "xz")
