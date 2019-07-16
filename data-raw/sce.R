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

# Report the size of each slot in bytes.
vapply(
    X = coerceS4ToList(sce),
    FUN = object_size,
    FUN.VALUE = numeric(1L)
)
object_size(sce)
stopifnot(object_size(sce) < limit)
validObject(sce)
