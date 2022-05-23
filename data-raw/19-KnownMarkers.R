## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(AcidSingleCell)
    library(pointillism)
})
## nolint end
data(cellTypeMarkersList, package = "AcidSingleCell")
data(SeuratMarkersPerCluster, package = "pointillism")
object <- KnownMarkers(
    markers = SeuratMarkersPerCluster,
    known = cellTypeMarkersList[["homoSapiens"]]
)
KnownMarkers <- object # nolint
use_data(
    KnownMarkers,
    compress = "xz",
    overwrite = TRUE
)
