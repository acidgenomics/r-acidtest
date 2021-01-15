suppressPackageStartupMessages({
    library(usethis)
    library(GenomicRanges)
    library(basejump)
})
GRanges <- makeGRangesFromEnsembl("Homo sapiens", release = 87L)
GRanges <- head(GRanges, n = 5L)
mcols <- mcols(GRanges)
colnames(mcols) <- camelCase(object = colnames(mcols), strict = TRUE)
mcols <- mcols[, c("geneId", "geneName")]
mcols[["geneId"]] <- as.character(mcols[["geneId"]])
mcols[["geneName"]] <- as.character(mcols[["geneName"]])
mcols(GRanges) <- mcols
use_data(GRanges, compress = "xz", overwrite = TRUE)
