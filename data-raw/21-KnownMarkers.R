## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(AcidSingleCell)
    library(pointillism)
})
## nolint end
load_all()
data(cellTypeMarkersList, package = "AcidSingleCell")
data(SeuratMarkersPerCluster)
markers <- SeuratMarkersPerCluster
known <- cellTypeMarkersList[["homoSapiens"]]
object <- KnownMarkers(
    markers = markers,
    known = known
)
KnownMarkers <- object # nolint
use_data(
    KnownMarkers,
    compress = "xz",
    overwrite = TRUE
)
