library(usethis)
library(pryr)
library(pointillism)

## Restrict to 1 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(1e6, class = "object_size")

data(Seurat)
sce <- as(Seurat, "SingleCellExperiment")
## FIXME This needs to be updated to match `geneId` instead of `geneID`..
sce <- convertSymbolsToGenes(sce)

## Assays.
stopifnot(identical(assayNames(sce), c("counts", "logcounts")))
## > assays(sce) <- assays(sce)["counts"]

## Dimensionality reduction.
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
## Drop "vst." columns.
keep <- !grepl(pattern = "^vst.", x = colnames(mcols(rowRanges(sce))))
mcols(rowRanges(sce)) <- mcols(rowRanges(sce))[keep]

## Report the size of each slot in bytes.
lapply(coerceS4ToList(sce), object_size)
object_size(sce)
stopifnot(object_size(sce) < limit)
validObject(sce)

SingleCellExperiment_Seurat <- sce
use_data(SingleCellExperiment_Seurat, compress = "xz", overwrite = TRUE)
