suppressPackageStartupMessages({
    library(usethis)
    library(AcidSingleCell)  # 0.2.0.9000
    library(Seurat)          # 4.1.0
    library(pointillism)     # 0.6.0.9000
})
data(cellTypeMarkersList, package = "AcidSingleCell")
data(Seurat)
SeuratMarkersPerCluster <-  # nolint
    withCallingHandlers(
        expr = SeuratMarkersPerCluster(
            object = FindAllMarkers(Seurat),
            ranges = rowRanges(Seurat)
        ),
        warning = function(w) {
            if (grepl("cannot compute exact p-value with ties", w)) {
                invokeRestart("muffleWarning")
            } else {
                w
            }
        }
    )
KnownMarkers <-  # nolint
    KnownMarkers(
        markers = SeuratMarkersPerCluster,
        known = cellTypeMarkersList[["homoSapiens"]]
    )
use_data(
    KnownMarkers,
    SeuratMarkersPerCluster,
    compress = "xz",
    overwrite = TRUE
)
