# nolint start

# log2 fold change matrix
# Order was randomized using `sample()`.
lfc <- matrix(
    data = c(
        -2.00, -1.25,  0.00,  0.25,  0.25,  0.50,  2.00,  4.00,
         2.00,  0.25, -1.25, -2.00,  0.50,  0.25,  4.00,  0.00,
         0.50,  4.00, -1.25,  0.25,  0.00,  0.25,  2.00, -2.00,
         4.00,  0.50, -2.00,  2.00,  0.25, -1.25,  0.25,  0.00
    ),
    nrow = 8L,
    ncol = 4L,
    byrow = FALSE,
    dimnames = list(
        paste0("gene", seq_len(8L)),
        paste0("contrast", seq_len(4L))
    )
)

# nolint end
