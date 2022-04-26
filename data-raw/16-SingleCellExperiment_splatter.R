## Splatter params are derived from:
## https://github.com/mikelove/zinbwave-deseq2/blob/master/
## zinbwave-deseq2.knit.md
suppressPackageStartupMessages({
    library(usethis)
    library(lobstr)
    library(SingleCellExperiment)
    library(splatter)
    library(basejump)
})
limit <- structure(1e6, class = "object_size")
sce <-
    newSplatParams() |>
    setParams(
        "batchCells" = 400L,
        "nGenes" = 100L,
        "seed" = 1L
    ) |>
    splatSimulate(
        group.prob = rep(0.25, times = 4L),
        method = "groups"
    )
## Sanitize the dimnames into camel case.
sce <- camelCase(sce, rownames = TRUE, colnames = TRUE, strict = TRUE)
colData(sce) <- camelCase(colData(sce))
## Prepare column data.
colData(sce) <- DataFrame(
    "sampleId" = factor(gsub(
        pattern = "group",
        replacement = "sample",
        x = camelCase(colData(sce)[["group"]])
    )),
    row.names = colnames(sce)
)
## Pad the zeros in rows and columns.
sce <- autopadZeros(sce, rownames = TRUE, colnames = TRUE)
## Just slot the raw counts, as a sparse matrix.
counts <- counts(sce)
counts <- as(counts, "sparseMatrix")
assays(sce) <- list("counts" = counts)
## Prepare row data.
rowRanges <- makeGRangesFromEnsembl(
    organism = "Homo sapiens",
    release = 100L,
    level = "genes",
    ignoreVersion = FALSE
)
rowRanges <- as(rowRanges, "GRanges")
rowRanges <- rowRanges[head(sort(names(rowRanges)), n = nrow(sce))]
rowRanges <- droplevels2(rowRanges)
## Note that we're keeping the original rownames from dds_small, and they won't
## match the `geneId` column in rowRanges. This is intentional, for unit tests.
names(rowRanges) <- rownames(sce)
rowRanges(sce) <- rowRanges
## Stash minimal metadata.
metadata(sce) <- list("date" = Sys.Date())
## Report the size of each slot in bytes.
lapply(X = coerceToList(sce), FUN = obj_size)
stopifnot(obj_size(sce) < limit)
validObject(sce)
SingleCellExperiment_splatter <- sce
use_data(SingleCellExperiment_splatter, compress = "xz", overwrite = TRUE)
