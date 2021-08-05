## NOTE Can simplify code here following pointillism update.
suppressPackageStartupMessages({
    library(magrittr)
    library(devtools)
    library(usethis)
    library(pryr)
    library(pointillism)
})
load_all()
limit <- structure(1e6, class = "object_size")
data(Seurat)
## NOTE Consider reworking coercion method to use strict lower camel case
## for names in colData and rowData.
sce <- as(Seurat, "SingleCellExperiment")
colnames(mcols(rowRanges(sce)))
##  [1] "broadClass"                "entrezId"
##  [3] "geneBiotype"               "geneId"
##  [5] "geneName"                  "seqCoordSystem"
##  [7] "vst.mean"                  "vst.variance"
##  [9] "vst.variance.expected"     "vst.variance.standardized"
## [11] "vst.variable"
colnames(mcols(rowRanges(sce))) <-
    camelCase(colnames(mcols(rowRanges(sce))), strict = TRUE)
sce <- convertSymbolsToGenes(sce)
colnames(mcols(rowRanges(sce))) <-
    camelCase(
        object = colnames(mcols(rowRanges(sce))),
        strict = TRUE
    )
colnames(mcols(rowRanges(sce)))
##  [1] "broadClass"              "entrezId"
##  [3] "geneBiotype"             "geneId"
##  [5] "geneName"                "seqCoordSystem"
##  [7] "vstMean"                 "vstVariance"
##  [9] "vstVarianceExpected"     "vstVarianceStandardized"
## [11] "vstVariable"
colnames(colData(sce))
## [1] "orig.ident"      "nCount_RNA"      "nFeature_RNA"    "RNA_snn_res.0.8"
## [5] "letter.idents"   "groups"          "RNA_snn_res.1"   "ident"
colnames(colData(sce)) <-
    camelCase(colnames(colData(sce)), strict = TRUE)
colnames(colData(sce))
## [1] "origIdent"    "nCountRna"    "nFeatureRna"  "rnaSnnRes0x8" "letterIdents"
## [6] "groups"       "rnaSnnRes1"   "ident"
stopifnot(identical(assayNames(sce), c("counts", "logcounts")))
## Dimensionality reduction.
## NOTE Coercion method should automatically coerce dim names to lower
## camel case?
stopifnot(identical(reducedDimNames(sce), c("PCA", "TSNE", "UMAP")))
reducedDims(sce) <- reducedDims(sce)["UMAP"]
reducedDimNames(sce) <- camelCase(reducedDimNames(sce), strict = TRUE)
## Column data.
cd <- colData(sce) %>% .[, "groups", drop = FALSE]
cd[["sampleId"]] <- factor(gsub("g", "sample", camelCase(cd[["groups"]])))
cd <- cd[, "sampleId", drop = FALSE]
colData(sce) <- cd
## Metadata.
metadata(sce) <- list("date" = Sys.Date())
## Row ranges.
## Drop "vst*" columns.
keep <- !grepl(pattern = "^vst", x = colnames(mcols(rowRanges(sce))))
mcols(rowRanges(sce)) <- mcols(rowRanges(sce))[keep]
## Report the size of each slot in bytes.
lapply(coerceToList(sce), object_size)
object_size(sce)
stopifnot(object_size(sce) < limit)
validObject(sce)
SingleCellExperiment_Seurat <- sce
use_data(SingleCellExperiment_Seurat, compress = "xz", overwrite = TRUE)
