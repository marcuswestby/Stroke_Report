
### Loading Data

here::i_am("Code/01_table1.R")
stroke_data <- read.csv(here::here("Data/healthcare-dataset-stroke-data.csv"))


### Table 1 - Descriptive analysis

library(labelled)
library(gtsummary)

stroke_data$smoking_status <- factor(stroke_data$smoking_status,
                                     levels(stroke_data$smoking_status) <- c("formerly smoked",            "never smoked", "smokes", "Unknown"),
                                     labels = c("Former Smoker","Never Smoker", "Current Smoker",
                                                "Unknown"))
stroke_data$bmi <- as.numeric(stroke_data$bmi)
stroke_data$stroke <- factor(stroke_data$stroke,     
                             levels(stroke_data$stroke) <- c("0", "1"),
                             labels = c("No Stroke", "Stroke"))

stroke_data$avg_glucose_level <- ifelse(stroke_data$avg_glucose_level < 95 , 0, 1)

stroke_data$avg_glucose_level <- factor(stroke_data$avg_glucose_level,
                                        levels(stroke_data$avg_glucose_level) <- c("0", "1"),
                                        labels = c("< 95 mg/dL", "> 95 mg/dL"))
var_label(stroke_data) <- list(
  gender = "Gender",
  age = "Age",
  hypertension = "Hypertension",
  heart_disease = "Heart Disease",
  Residence_type = "Urban/Rural",
  avg_glucose_level = "Blood Glucose Level",
  bmi = "BMI",
  smoking_status = "Smoking Status",
  stroke = "Stroke"
)


table1 <- stroke_data |>
  select("gender", "age", "hypertension", "heart_disease",
         "Residence_type", "avg_glucose_level","bmi", "smoking_status", "stroke")|>
  tbl_summary(by = stroke) |>
  add_overall() |>
  bold_labels()

saveRDS(
  table1,
  file = here::here("output/table1.rds")
)