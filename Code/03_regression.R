
### Loading Data

here::i_am("Code/03_regression.R")
stroke_data <- read.csv(here::here("Data/healthcare-dataset-stroke-data.csv"))


#Logistic Regression
library(ggplot2)
library(broom)
m1 <- glm(stroke ~ avg_glucose_level, family = binomial(link = "logit"), data = stroke_data)

regression_mod <- ggplot(stroke_data, aes(x=avg_glucose_level, y=stroke)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

saveRDS(
  regression_mod,
  file = here::here("output/regression_mod.rds")
)

