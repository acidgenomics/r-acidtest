#!/bin/sh

ls
R CMD build .
R CMD check acidtest_*.tar.gz
