suppressPackageStartupMessages({
    library(goalie)
    library(usethis)
    library(lobstr)
    library(basejump)
    library(pointillism)
})
limit <- structure(1e6L, class = "object_size")
data(Seurat, package = "pointillism")
sce <- as(Seurat, "SingleCellExperiment")
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
## Report the size of each slot in bytes.
lapply(coerceToList(sce), obj_size)
stopifnot(obj_size(sce) < limit)
validObject(sce)
SingleCellExperiment_Seurat <- sce # nolint
use_data(SingleCellExperiment_Seurat, compress = "xz", overwrite = TRUE)
