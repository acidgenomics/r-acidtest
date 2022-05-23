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
DataFrame <- object # nolint
use_data(DataFrame, compress = "xz", overwrite = TRUE)
