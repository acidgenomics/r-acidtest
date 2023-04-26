## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(IRanges)
})
## nolint end
object <- IRanges(
    c(1L, 10L, 20L),
    width = 5L,
    names = letters[seq_len(3L)]
)
mcols(object) <- DataFrame(score = seq(3L))
IRanges <- object # nolint
use_data(IRanges, compress = "xz", overwrite = TRUE)
