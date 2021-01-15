suppressPackageStartupMessages({
    library(magrittr)
    library(usethis)
    library(pryr)
    library(SummarizedExperiment)
    library(basejump)
})
## Restrict to 1 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(1e6, class = "object_size")
organism <- "Homo sapiens"
release <- 99L
tx2gene <-
    makeTx2GeneFromEnsembl(organism, release = release) %>%
    as("DataFrame") %>%
    set_colnames(c("txId", "geneID"))
## Pick transcripts that have gene overlaps, to test our `aggregate()` code.
transcripts <- c(
    "ENST00000494424",
    "ENST00000496771",
    "ENST00000612152",
    "ENST00000371584",
    "ENST00000371588",
    "ENST00000413082"
)
stopifnot(all(transcripts %in% tx2gene[["txId"]]))
samples <- paste0("sample", seq_len(4L))
counts <- matrix(
    data = seq_len(length(transcripts) * length(samples)),
    byrow = TRUE,
    nrow = length(transcripts),
    ncol = length(samples),
    dimnames = list(transcripts, samples)
)
rowData <- tx2gene %>%
    as("DataFrame") %>%
    .[
        match(x = rownames(counts), table = .[["txId"]]),
        ,
        drop = FALSE
    ]
se <- SummarizedExperiment(
    assays = list(counts = counts),
    rowData = rowData,
    metadata = list(date = Sys.Date())
)
## Size checks.
lapply(coerceS4ToList(se), object_size)
object_size(se)
stopifnot(object_size(se) < limit)
validObject(se)
SummarizedExperiment_transcripts <- se
use_data(SummarizedExperiment_transcripts, compress = "xz", overwrite = TRUE)
