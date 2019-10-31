library(usethis)  # 1.5.1
library(IRanges)  # 2.20.0
IRanges <- IRanges(
    c(1L, 10L, 20L),
    width = 5L,
    names = letters[seq_len(3L)]
)
mcols(IRanges) <- DataFrame(score = seq(3L))
use_data(IRanges, compress = "xz", overwrite = TRUE)
