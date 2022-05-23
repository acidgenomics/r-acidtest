## nolint start
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(tibble)
})
## nolint end
load_all()
data(data.frame)
object <- as_tibble(data.frame, rownames = "rowname")
tibble <- object
use_data(tibble, compress = "xz", overwrite = TRUE)
