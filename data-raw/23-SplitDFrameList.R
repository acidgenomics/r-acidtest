suppressPackageStartupMessages({
    library(IRanges)
    library(usethis)
})
SplitDFrameList <- SplitDataFrameList(
    DataFrame(X = 1L, Y = 2L),
    DataFrame(X = 1L:2L, Y = 3L:4L)
)
use_data(SplitDFrameList, compress = "xz", overwrite = TRUE)
