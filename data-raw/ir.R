library(IRanges)
library(usethis)

ir <- IRanges(
    c(1L, 10L, 20L),
    width = 5L,
    names = letters[1L:3L]
)
mcols(ir) <- DataFrame(score = seq(3L))

use_data(ir, compress = "xz", overwrite = TRUE)
