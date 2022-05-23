## nolint start
suppressPackageStartupMessages({
    library(usethis)
    library(SummarizedExperiment)
    library(basejump)
})
## nolint end
limit <- structure(1e6L, class = "object_size")
tx2gene <- makeTx2GeneFromEnsembl(
    organism = "Homo sapiens",
    release = 100L,
    ignoreVersion = FALSE
)
## Pick transcripts that have gene overlaps, to test our `aggregate()` code.
transcripts <- c(
    "ENST00000494424.1",
    "ENST00000496771.5",
    "ENST00000612152.4",
    "ENST00000371584.8",
    "ENST00000371588.9",
    "ENST00000413082.1"
)
genes <- c(
    "ENSG00000000003.15",
    "ENSG00000000419.12"
)
stopifnot(
    all(transcripts %in% tx2gene[["txId"]]),
    all(genes %in% tx2gene[["geneId"]])
)
samples <- paste0("sample", seq_len(4L))
counts <- matrix(
    data = seq_len(length(transcripts) * length(samples)),
    byrow = TRUE,
    nrow = length(transcripts),
    ncol = length(samples),
    dimnames = list(transcripts, samples)
)
assays <- SimpleList("counts" = counts)
rowData <- as(tx2gene, "DataFrame")
rowData <- rowData[
    match(x = rownames(assays[[1L]]), table = rowData[["txId"]]), ,
    drop = FALSE
]
se <- SummarizedExperiment(
    assays = assays,
    rowData = rowData
)
stopifnot(
    object.size(se) < limit,
    validObject(se)
)
SummarizedExperiment_transcripts <- se # nolint
use_data(SummarizedExperiment_transcripts, compress = "xz", overwrite = TRUE)
