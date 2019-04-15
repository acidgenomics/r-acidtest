#!/bin/sh

setwd("/travis")

devtools::check()
BiocCheck::BiocCheck(".")
lintr::lint_package()
covr::report()
