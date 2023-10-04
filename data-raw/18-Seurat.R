## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(basejump)
    library(pointillism) # 0.7.0
    library(Seurat) # 4.9.9.9067
    library(SeuratObject)
})
options("Seurat.object.assay.version" = "v5")
## nolint end
limit <- structure(1e6L, class = "object_size")
data(pbmc_small, package = "SeuratObject")
object <- pbmc_small
object <- UpdateSeuratObject(object)
stopifnot(object.size(object) < limit)
object <- RunUMAP(object, dims = seq_len(10L))
## Slot row ranges into the Seurat object.
rowRanges <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    level = "genes",
    genomeBuild = "GRCh37",
    ignoreVersion = TRUE
)
rowRanges <- as(rowRanges, "GRanges")
rn <- rownames(object)
table <- make.unique(as.character(mcols(rowRanges)[["geneName"]]))
names(rowRanges) <- table
stopifnot(all(rn %in% table))
which <- match(x = rn, table = table)
rowRanges <- rowRanges[which]
rowRanges <- droplevels2(rowRanges)
stopifnot(object.size(rowRanges) < limit)
rowRanges(object) <- rowRanges
stopifnot(
    object.size(object) < limit,
    validObject(object)
)
Seurat <- object # nolint
use_data(Seurat, compress = "xz", overwrite = TRUE)
