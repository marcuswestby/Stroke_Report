FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /Stroke_Report
WORKDIR /Stroke_Report

RUN mkdir Code
RUN mkdir output
RUN mkdir Data
COPY Code Code
COPY Data Data
COPY makefile . 
COPY StrokeReport_Descriptive.Rmd .
COPY StrokeReport_Final.Rmd .
COPY StrokeReport_Graphical.Rmd .

COPY .Rprofile . 
COPY renv.lock . 
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.dcf renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN mkdir report

CMD make && mv StrokeReport_Final.html report

