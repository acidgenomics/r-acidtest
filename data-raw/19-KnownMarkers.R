## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(AcidSingleCell)
    library(pointillism)
})
## nolint end
data(cellTypeMarkersList, package = "AcidSingleCell")
## This refers to SeuratMarkersPerCluster object.
data(smpc, package = "pointillism")
object <- KnownMarkers(
    markers = smpc,
    known = cellTypeMarkersList[["homoSapiens"]]
)
KnownMarkers <- object # nolint
use_data(
    KnownMarkers,
    compress = "xz",
    overwrite = TRUE
)
