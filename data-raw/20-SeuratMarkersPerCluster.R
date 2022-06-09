## nolint start
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(Seurat)
    library(pointillism)
})
## nolint end
load_all()
data(Seurat)
object <- Seurat
smpc <- withCallingHandlers(
    expr = SeuratMarkersPerCluster(
        object = FindAllMarkers(object),
        ranges = rowRanges(object)
    ),
    warning = function(w) {
        if (grepl("cannot compute exact p-value with ties", w)) {
            invokeRestart("muffleWarning")
        } else {
            w
        }
    }
)
SeuratMarkersPerCluster <- smpc # nolint
use_data(SeuratMarkersPerCluster, compress = "xz", overwrite = TRUE)
