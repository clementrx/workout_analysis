library(quarto)
library(here)

system(paste0('quarto.cmd render ', here("report.qmd")))
