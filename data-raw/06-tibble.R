suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(tibble)
})
load_all()
data(data.frame)
tibble <-
    as_tibble(data.frame, rownames = "rowname")
use_data(tibble, compress = "xz", overwrite = TRUE)
