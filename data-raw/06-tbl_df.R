suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(tibble)
})
load_all()
data(matrix)
tbl_df <- as_tibble(matrix, rownames = "rowname")
use_data(tbl_df, compress = "xz", overwrite = TRUE)
