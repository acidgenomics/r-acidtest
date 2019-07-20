# Create SingleCellExperiment object from Seurat.
# Updated 2019-07-16.

library(usethis)
library(pryr)
library(pointillism)  # 0.3.2

# Restrict to 1 MB.
# Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(1e6, class = "object_size")

data(seurat, package = "acidtest")
sce <- as(seurat, "SingleCellExperiment")
sce <- convertSymbolsToGenes(sce)

# Assays.
stopifnot(identical(assayNames(sce), c("counts", "logcounts")))
# > assays(sce) <- assays(sce)["counts"]

# Dimensionality reduction.
stopifnot(identical(reducedDimNames(sce), c("PCA", "TSNE", "UMAP")))
reducedDims(sce) <- reducedDims(sce)["UMAP"]
reducedDimNames(sce) <- camel(reducedDimNames(sce))

# Column data.
cd <- colData(sce) %>% .[, "groups", drop = FALSE]
cd$sampleID <- factor(gsub("g", "sample", camel(cd$groups)))
cd <- cd[, "sampleID", drop = FALSE]
colData(sce) <- cd

# Metadata.
metadata(sce) <- list(date = Sys.Date())

# Row ranges.
# Drop "vst." columns.
keep <- !grepl(pattern = "^vst.", x = colnames(mcols(rowRanges(sce))))
mcols(rowRanges(sce)) <- mcols(rowRanges(sce))[keep]

# Report the size of each slot in bytes.
vapply(
    X = coerceS4ToList(sce),
    FUN = object_size,
    FUN.VALUE = numeric(1L)
)
object_size(sce)
stopifnot(object_size(sce) < limit)
validObject(sce)

SingleCellExperiment_Seurat
use_data(SingleCellExperiment_Seurat, compress = "xz", overwrite = TRUE)
