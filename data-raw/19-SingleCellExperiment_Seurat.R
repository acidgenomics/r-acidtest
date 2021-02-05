## NOTE Can simplify internal code here following pointillism update.
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(pryr)
    library(pointillism)
})
load_all()
## Restrict to 1 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(1e6, class = "object_size")
data(Seurat)
## FIXME Consider making this step coerce rowRanges mcols colnames to strict
## lower camel case.
## FIXME Consider making this step coerce colData colnames to strict lower
## camel case.
sce <- as(Seurat, "SingleCellExperiment")
colnames(mcols(rowRanges(sce))) <-
    gsub(
        pattern = "Id$",
        replacement = "ID",
        x = colnames(mcols(rowRanges(sce)))
    )
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
colnames(colData(sce)) <-
    camelCase(
        object = colnames(colData(sce)),
        strict = TRUE
    )
colnames(colData(sce))
## [1] "origIdent"    "nCountRna"    "nFeatureRna"  "rnaSnnRes0x8"
## [5] "letterIdents" "groups"       "rnaSnnRes1"   "ident"
## Assays.
stopifnot(identical(assayNames(sce), c("counts", "logcounts")))
## > assays(sce) <- assays(sce)["counts"]
## Dimensionality reduction.
## FIXME Coercion method should automatically coerce dim names to lower
## camel case.
stopifnot(identical(reducedDimNames(sce), c("PCA", "TSNE", "UMAP")))
reducedDims(sce) <- reducedDims(sce)["UMAP"]
reducedDimNames(sce) <- camelCase(reducedDimNames(sce))
## Column data.
cd <- colData(sce) %>% .[, "groups", drop = FALSE]
cd$sampleId <- factor(gsub("g", "sample", camelCase(cd$groups)))
cd <- cd[, "sampleId", drop = FALSE]
colData(sce) <- cd
## Metadata.
metadata(sce) <- list(date = Sys.Date())
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
