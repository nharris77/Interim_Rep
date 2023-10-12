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

# Calculate average hazmat cars damaged and average hazmat cars for each Train company

# Union Pacific
union_pacific_haz <- mean(union_pacific$`Hazmat Cars Damaged`)
union_haz_rnd <- round(union_pacific_haz, digits = 5)

union_pacific_haz_car <- mean(union_pacific$`Hazmat Cars`)
union_haz_car_rnd <- round(union_pacific_haz_car, digits = 5)

# Norfolk Southern
norfolk_haz <- mean(norfolk_southern$`Hazmat Cars Damaged`)
norfolk_haz_rnd <- round(norfolk_haz, digits = 5)

norfolk_haz_car <- mean(norfolk_southern$`Hazmat Cars`)
norfolk_haz_car_rnd <- round(norfolk_haz_car, digits = 5)

# Illinois Central
illi_haz <- mean(illinois_central$`Hazmat Cars Damaged`)
illi_haz_rnd <- round(illi_haz, digits = 5)

illi_haz_car <- mean(illinois_central$`Hazmat Cars`)
illi_haz_car_rnd <- round(illi_haz_car, digits = 5)

# Conrail
con_haz <- mean(conrail$`Hazmat Cars Damaged`)
con_haz_rnd <- round(con_haz, digits = 5)

con_haz_car <- mean(conrail$`Hazmat Cars`)
con_haz_car_rnd <- round(con_haz_car, digits = 5)
