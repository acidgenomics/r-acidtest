suppressPackageStartupMessages({
    library(usethis)
    library(lobstr)
    library(GenomicRanges)
    library(basejump)
})
limit <- structure(1e6, class = "object_size")
gr <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    level = "genes",
    release = 87L,
    ignoreVersion = TRUE
)
gr <- as(gr, "GRanges")
gr <- gr[sort(names(gr))]
gr <- head(gr, n = 5L)
cols <- c("geneId", "geneName")
mcols(gr) <- mcols(gr)[, cols]
gr <- droplevels2(gr)
lapply(coerceToList(gr), obj_size)
stopifnot(obj_size(gr) < limit)
GenomicRanges <- gr # nolint
use_data(GenomicRanges, compress = "xz", overwrite = TRUE)
