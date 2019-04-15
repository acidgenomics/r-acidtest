#!/bin/sh

setwd("/travis")

# devtools::check(pkg = ".", document = FALSE)
rcmdcheck::rcmdcheck(path = ".")
BiocCheck::BiocCheck(package = ".")
lintr::lint_package(path = ".")
covr::report()
