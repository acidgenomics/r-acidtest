## nolint start
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(SingleCellExperiment)
    library(basejump)
})
## nolint end
load_all()
limit <- structure(1e6L, class = "object_size")
data(SingleCellExperiment_splatter)
sce <- SingleCellExperiment_splatter
sce <- sce[seq_len(100L), seq_len(32L)]
sce <- droplevels2(sce)
stopifnot(object.size(sce) < limit)
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
SingleCellExperiment_lanesplit <- sce # nolint
use_data(SingleCellExperiment_lanesplit, compress = "xz", overwrite = TRUE)
