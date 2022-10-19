here::i_am("Code/04_render_report.R")

library(rmarkdown)
render("StrokeReport_Descriptive.Rmd")
render("StrokeReport_Graphical.Rmd")
render("StrokeReport_Final.Rmd")