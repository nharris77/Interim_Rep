# Nick Harris and Max Manyak Interim Presentation

# Data Clean

library(dplyr)

train_accident <- readr::read_csv("~/Downloads/Rail_Equipment_Accident_Incident_Data.csv")

union_pacific <- train_accident %>%
  filter(`Reporting Railroad Name` %in% c("Union Pacific Railroad Company"))

norfolk_southern <- train_accident %>%
  filter(`Reporting Railroad Name` %in% c("Norfolk Southern Railway Company"))

illinois_central <- train_accident %>%
  filter(`Reporting Railroad Name` %in% c("Illinois Central Railroad Company"))

conrail <- train_accident %>%
  filter(`Reporting Railroad Name` %in% c("Conrail"))
