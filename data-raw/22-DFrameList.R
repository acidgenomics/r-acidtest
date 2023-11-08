## nolint start
suppressPackageStartupMessages({
    library(IRanges)
    library(usethis)
})
## nolint end
DFrameList <- # nolint
    DataFrameList(
        DataFrame("X" = 1L, "Y" = 2L),
        DataFrame("A" = 1L:2L, "B" = 3L:4L)
    )
use_data(DFrameList, compress = "xz", overwrite = TRUE)
