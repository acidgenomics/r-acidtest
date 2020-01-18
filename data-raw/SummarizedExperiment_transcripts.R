library(usethis)               # 1.5.1
library(pryr)                  # 0.1.4
library(SummarizedExperiment)  # 1.16.1
library(basejump)              # 0.11.24

## Restrict to 1 MB.
## Use `pryr::object_size()` instead of `utils::object.size()`.
limit <- structure(1e6, class = "object_size")

organism <- "Homo sapiens"
release <- 92L

tx2gene <- makeTx2GeneFromEnsembl(organism, release = release)
print(tx2gene)

## Pick transcripts that have gene overlaps, to test our aggregate code.
transcripts <- c(
    "ENST00000494424",
    "ENST00000496771",
    "ENST00000612152",
    "ENST00000371584",
    "ENST00000371588",
    "ENST00000413082"
)
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
        match(x = rownames(counts), table = .[["transcriptID"]]),
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
