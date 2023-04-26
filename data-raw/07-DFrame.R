## nolint start
suppressPackageStartupMessages({
    library(devtools)
    library(usethis)
    library(S4Vectors)
})
## nolint end
load_all()
data(data.frame)
object <- DataFrame(data.frame)
DFrame <- object # nolint
use_data(DFrame, compress = "xz", overwrite = TRUE)
