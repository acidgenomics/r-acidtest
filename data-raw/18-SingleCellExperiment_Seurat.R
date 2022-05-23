## nolint start
suppressPackageStartupMessages({
    library(goalie)
    library(usethis)
    library(basejump)
    library(pointillism)
})
## nolint end
limit <- structure(1e6L, class = "object_size")
data(seurat, package = "pointillism")
sce <- as(seurat, "SingleCellExperiment")
colnames(mcols(rowRanges(sce)))
## [1] "broadClass"     "entrezId"       "geneBiotype"    "geneId"
## [5] "geneName"       "seqCoordSystem"
sce <- convertSymbolsToGenes(sce)
colnames(mcols(rowRanges(sce)))
## [1] "broadClass"     "entrezId"       "geneBiotype"    "geneId"
## [5] "geneName"       "seqCoordSystem"
colnames(colData(sce))
## [1] "orig.ident"      "nCount_RNA"      "nFeature_RNA"    "RNA_snn_res.0.8"
## [5] "letter.idents"   "groups"          "RNA_snn_res.1"   "ident"
assert(
    identical(assayNames(sce), c("counts", "logcounts")),
    identical(reducedDimNames(sce), c("PCA", "TSNE", "UMAP"))
)
stopifnot(
    object.size(sce) < limit,
    validObject(sce)
)
SingleCellExperiment_Seurat <- sce # nolint
use_data(SingleCellExperiment_Seurat, compress = "xz", overwrite = TRUE)
