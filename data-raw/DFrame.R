## Note that this now returns "DFrame" instead of "DataFrame", as of
## Bioconductor 3.10 release.
library(usethis)    # 1.5.1
library(S4Vectors)  # 0.24.2
data(matrix)
DFrame <- DataFrame(matrix)
use_data(DFrame, compress = "xz", overwrite = TRUE)
