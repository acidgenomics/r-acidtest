suppressPackageStartupMessages({
    library(usethis)
})
data.frame <-  # nolint
    data.frame(
        "genotype" = factor(
            x = c(
                "wildtype",
                "knockout",
                "wildtype",
                "knockout"
            ),
            levels = c("wildtype", "knockout")
        ),
        "treatment" = factor(
            x = c(
                "control",
                "control",
                "treated",
                "treated"
            ),
            levels = c("control", "treated")
        ),
        row.names = c(
            "sample1",
            "sample2",
            "sample3",
            "sample4"
        )
    )
use_data(data.frame, compress = "xz", overwrite = TRUE)
