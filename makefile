StrokeReport_Final.html: StrokeReport_Final.Rmd Code/04_render_report.R output/table1.rds output/bar_graph.rds output/regression_mod.rds
	Rscript Code/04_render_report.R

StrokeReport_Descriptive.html: StrokeReport_Descriptive.Rmd Code/04_render_descriptive_report.R output/table1.rds
	Rscript Code/04_render_descriptive_report.R

StrokeReport_Graphical.html: StrokeReport_Graphical.Rmd Code/04_render_graphical_report.R output/bar_graph.rds output/regression_mod.rds
	Rscript Code/04_render_graphical_report.R
	
output/table1.rds: 
	Rscript Code/01_table1.R
	
output/bar_graph.rds: 
	Rscript Code/02_bar_graph.R
	
output/regression_mod.rds: 
	Rscript Code/03_regression.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f *.html

.PHONY: install	
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# Docker Rules
michelastephens/project_image:
	docker build -t michelastephens/project_image .
	touch $@

# rule to build report automatically in container
report/StrokeReport_Final.html: 
	docker run -v "/$$(pwd)/report":/Stroke_Report/report michelastephens/project_image


	