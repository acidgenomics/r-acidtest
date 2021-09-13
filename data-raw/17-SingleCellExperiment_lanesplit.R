suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(lobstr)
    library(SingleCellExperiment)
    library(basejump)
})
load_all()
limit <- structure(1e6, class = "object_size")
data(SingleCellExperiment)
sce <- SingleCellExperiment
sce <- sce[seq_len(100L), seq_len(32L)]
sce <- droplevels(sce)
stopifnot(obj_size(sce) < limit)
## 2 samples * 4 lane splits * 4 barcodes = 32.
samples <- paste("sample", seq_len(2L), sep = "_")
lanes <- paste0("L00", seq_len(4L))
barcodes <- c(
    "AAAAAA_AAAAAA_AAAAAA",
    "CCCCCC_CCCCCC_CCCCCC",
    "GGGGGG_GGGGGG_GGGGGG",
    "TTTTTT_TTTTTT_TTTTTT"
)
colnames(sce) <- paste(
    rep(x = samples, each = length(barcodes) * length(lanes)),
    rep(x = lanes, times = length(barcodes) * length(samples)),
    rep(x = barcodes, each = length(lanes), times = length(samples)),
    sep = "_"
)
colData(sce) <- DataFrame(
    "sampleId" = as.factor(paste(
        rep(x = samples, each = length(barcodes) * length(lanes)),
        rep(x = lanes, times = length(barcodes) * length(samples)),
        sep = "_"
    )),
    "aggregate" = as.factor(
        rep(x = samples, each = length(barcodes) * length(lanes))
    ),
    row.names = colnames(sce)
)
SingleCellExperiment_lanesplit <- sce
use_data(SingleCellExperiment_lanesplit, compress = "xz", overwrite = TRUE)
