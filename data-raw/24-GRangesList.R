## nolint start
suppressPackageStartupMessages({
    library(GenomicRanges)
    library(usethis)
})
## nolint end
GRangesList <- # nolint
    GRangesList(
        GRanges(
            seqnames = "chr2",
            ranges = IRanges(start = 3L, end = 6L),
            strand = "+",
            score = 5L,
            gc = 0.45
        ),
        GRanges(
            seqnames = c("chr1", "chr1"),
            ranges = IRanges(start = c(7L, 13L), width = 3L),
            strand = c("+", "-"),
            score = 3L:4L,
            gc = c(0.3, 0.5)
        ),
        GRanges(
            seqnames = c("chr1", "chr2"),
            ranges = IRanges(start = c(1L, 4L), end = c(3L, 9L)),
            strand = c("-", "-"),
            score = c(6L, 2L),
            gc = c(0.4, 0.1)
        )
    )
use_data(GRangesList, compress = "xz", overwrite = TRUE)
