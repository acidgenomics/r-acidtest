suppressPackageStartupMessages({
    library(usethis)
})
data.frame <- head(datasets::USArrests)  # nolint
matrix <- as.matrix(data.frame)
syntactic <- list(
    character = c(
        "%GC",
        "10uM",
        "5'-3' bias",
        "5prime",
        "G2M.Score",
        "hello world",
        "HELLO WORLD",
        "Mazda RX4",
        "nCount",
        "RNAi clones",
        "tx2gene",
        "TX2GeneID",
        "worfdbHTMLRemap",
        123L
    ),
    character_named = c(
        Item.A = "hello world",
        Item.B = "HELLO WORLD"
    ),
    factor = factor(
        c(
            "sample 1" = "group 1",
            "sample 2" = "group 1",
            "sample 3" = "group 2",
            "sample 4" = "group 2"
        )
    ),
    list = list(
        Item.A = c(1L, 2L),
        Item.B = c(3L, 4L)
    ),
    matrix = matrix,
    data.frame = data.frame
)
use_data(syntactic, compress = "xz", overwrite = TRUE)
