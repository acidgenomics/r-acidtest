## nolint start
suppressPackageStartupMessages({
    library(usethis)
})
## nolint end
object <- list()
object[["character"]] <-
    c(
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
    )
object[["character_named"]] <-
    c(
        "Item.A" = "hello world",
        "Item.B" = "HELLO WORLD"
    )
object[["factor"]] <-
    factor(c(
        "sample 1" = "group 1",
        "sample 2" = "group 1",
        "sample 3" = "group 2",
        "sample 4" = "group 2"
    ))
object[["list"]] <-
    list(
        "Item.A" = c(1L, 2L),
        "Item.B" = c(3L, 4L)
    )
object[["data.frame"]] <- head(datasets::USArrests)
object[["matrix"]] <- as.matrix(object[["data.frame"]])
object <- object[sort(names(object))]
syntactic <- object
use_data(syntactic, compress = "xz", overwrite = TRUE)
