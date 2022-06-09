## FIXME Rework this.

## nolint start
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(goalie)
    library(basejump)
    library(pointillism)
})
## nolint end
load_all()
limit <- structure(1e6L, class = "object_size")
data(Seurat)
object <- as(Seurat, "SingleCellExperiment")
colnames(mcols(rowRanges(object)))
## [1] "broadClass"     "entrezId"       "geneBiotype"    "geneId"
## [5] "geneName"       "seqCoordSystem"
object <- convertSymbolsToGenes(object)
colnames(mcols(rowRanges(object)))
## [1] "broadClass"     "entrezId"       "geneBiotype"    "geneId"
## [5] "geneName"       "seqCoordSystem"
colnames(colData(object))
## [1] "orig.ident"      "nCount_RNA"      "nFeature_RNA"    "RNA_snn_res.0.8"
## [5] "letter.idents"   "groups"          "RNA_snn_res.1"   "ident"
assert(
    identical(assayNames(object), c("counts", "logcounts")),
    identical(reducedDimNames(object), c("PCA", "TSNE", "UMAP"))
)
stopifnot(
    object.size(object) < limit,
    validObject(object)
)
SingleCellExperiment_Seurat <- object # nolint
use_data(SingleCellExperiment_Seurat, compress = "xz", overwrite = TRUE)
