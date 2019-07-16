# SummarizedExperiment
# Modified version of the `SummarizedExperiment()` documentation example.

nrows <- 200L
ncols <- 6L

counts <- matrix(data = runif(nrows * ncols, 1L, 1e4L), nrow = nrows)
rowRanges <- GRanges(
    rep(c("chr1", "chr2"), c(50L, 150L)),
    IRanges(floor(runif(200L, 1e5L, 1e6L)), width = 100L),
    strand = sample(c("+", "-"), 200L, TRUE),
    featureID = sprintf("ID%03d", 1L:200L)
)
colData <- DataFrame(
    treatment = rep(c("ChIP", "Input"), 3L),
    row.names = LETTERS[seq_len(6L)]
)

rse <- SummarizedExperiment(
    assays = SimpleList(counts = counts),
    rowRanges = rowRanges,
    colData = colData
)
save(rse, file = file.path("inst", "extdata", "rse.rda"))
