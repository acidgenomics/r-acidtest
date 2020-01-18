library(usethis)        # 1.5.1
library(GenomicRanges)  # 1.38.0
library(basejump)       # 0.11.24
GRanges <- makeGRangesFromEnsembl("Homo sapiens", release = 87L)
GRanges <- head(GRanges, n = 5L)
mcols <- mcols(GRanges)
mcols <- mcols[, c("geneID", "geneName")]
mcols[["geneID"]] <- as.character(mcols[["geneID"]])
mcols[["geneName"]] <- as.character(mcols[["geneName"]])
mcols(GRanges) <- mcols
use_data(GRanges, compress = "xz", overwrite = TRUE)
