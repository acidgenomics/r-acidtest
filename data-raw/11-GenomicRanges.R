## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(GenomicRanges)
    library(basejump)
})
## nolint end
limit <- structure(1e6L, class = "object_size")
object <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    level = "genes",
    release = 87L,
    ignoreVersion = TRUE
)
object <- as(object, "GRanges")
object <- object[sort(names(object))]
object <- head(object, n = 5L)
cols <- c("geneId", "geneName")
mcols(object) <- mcols(object)[, cols]
object <- droplevels2(object)
stopifnot(object.size(object) < limit)
GenomicRanges <- object # nolint
use_data(GenomicRanges, compress = "xz", overwrite = TRUE)
