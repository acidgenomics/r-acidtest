suppressPackageStartupMessages({
    library(usethis)
    library(AcidSingleCell) # 0.2.0.9000
    library(pointillism) # 0.6.0.9000
})
data(cellTypeMarkersList, package = "AcidSingleCell")
data(SeuratMarkersPerCluster, package = "pointillism")
KnownMarkers <- # nolint
    KnownMarkers(
        markers = SeuratMarkersPerCluster,
        known = cellTypeMarkersList[["homoSapiens"]]
    )
use_data(
    KnownMarkers,
    compress = "xz",
    overwrite = TRUE
)
