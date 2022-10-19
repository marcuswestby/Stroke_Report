
### Loading Data

here::i_am("Code/02_bar_graph.R")
stroke_data <- read.csv(here::here("Data/healthcare-dataset-stroke-data.csv"))


# Bar Graph of Smoking Status

library(ggplot2)

bar_graph <- ggplot(stroke_data, aes(smoking_status)) +
  geom_bar(fill = "#0073C2FF") +
  theme_classic() 

bar_graph2 <- bar_graph + labs(x="Smoking Status", y = "Count", 
                               title = "Smoking Status Counts for Study Population")


saveRDS(
  bar_graph2,
  file = here::here("output/bar_graph.rds")
)



