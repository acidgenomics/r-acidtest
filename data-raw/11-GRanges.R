suppressPackageStartupMessages({
    library(usethis)
    library(pryr)
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
gr <- droplevels(gr)
lapply(coerceToList(gr), object_size)
object_size(gr)
stopifnot(object_size(gr) < limit)
GRanges <- gr
use_data(GRanges, compress = "xz", overwrite = TRUE)
