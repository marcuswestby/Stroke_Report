# Makefile Contents

`makefile`
- contains rule for building final report
- contains rule for building descriptive report
- contains rule for building graphical report
- contains rule for cleaning output
- contains rule for synchronizing package library

# To generate the final report

- type "make" in the terminal to generate the final report

# Code Description

`Code/01_table1.R`
- makes table 1 
- saves table 1 as an rds object

`Code/02_bar_graph.R`
- creates bar graph of smoking status 
- saves bar graph as an rds object

`Code/03_regression.R`
- creates logistical regression model stroke and average glucose level
- generates graph from logistic regression model
- saves regression graph as an rds object

`code/04_render_report.R`
- renders `StrokeReport_Descriptive.Rmd`
- renders `StrokeReport_Graphical.Rmd`
- renders `StrokeReport_Final.Rmd`

`StrokeReport_Descriptive.Rmd`
- reads the table 1 object 

`StrokeReport_Graphical.Rmd`
- reads the bar graph object
- reads the regression model graph object

`StrokeReport_Final.Rmd`
- reads the table 1 object 
- reads the bar graph object
- reads the regression model graph object

# Synchronize Package Library

- type "make install" in the terminal to synchronize package library

# Building and running the Docker Image 

- navigate to the following link to pull the docker image <https://hub.docker.com/repository/docker/michelastephens/project_image>
- type "docker build -t michelastephens/project_image bash" in the terminal to build the docker image 
- type "docker run -it michelastephens/project_image bash" in the terminal
- type "make" to build the report inside the container

# Automated version of the image

- for an automatically generated report, type "make report/StrokeReport_Final.html" in the terminal 
- the final report will appear in a local folder called "report"




