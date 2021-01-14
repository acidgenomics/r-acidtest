library(usethis)
library(GenomicRanges)  # 1.38.0
library(basejump)       # 0.12.4
GRanges <- makeGRangesFromEnsembl("Homo sapiens", release = 87L)
GRanges <- head(GRanges, n = 5L)
mcols <- mcols(GRanges)
mcols <- mcols[, c("geneId", "geneName")]
mcols[["geneId"]] <- as.character(mcols[["geneId"]])
mcols[["geneName"]] <- as.character(mcols[["geneName"]])
mcols(GRanges) <- mcols
use_data(GRanges, compress = "xz", overwrite = TRUE)
