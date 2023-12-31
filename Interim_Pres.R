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

# Calculate average number of hazmat cars damaged +
# average number of hazmat cars for each Train company

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

# Visuals

library(ggplot2)

# Average Number of Hazmat Cars

haz_car_per_co <- data.frame(
  Railroad_Company = c("Union Pacific", "Norfolk Southern", "Illinois Central", "Conrail"),
  avg_num_cars = c(union_haz_car_rnd, norfolk_haz_car_rnd, illi_haz_car_rnd, con_haz_car_rnd)
)

ggplot(haz_car_per_co,
       aes(x = reorder(Railroad_Company, avg_num_cars),
           y = avg_num_cars, fill = factor(Railroad_Company))) +
  geom_bar(stat = "identity") +
  labs(title = "Average Number of Hazmat Cars per Railroad Company", x = "Railroad Company", y = "Average Number of Hazmat Cars",
       fill = "Railroad_Company") + 
  theme_minimal()

# Average Number of Hazmat Cars Damaged

haz_dam_per_co <- data.frame(
  Railroad_Company = c("Union Pacific", "Norfolk Southern", "Illinois Central", "Conrail"),
  avg_car_dam = c(union_haz_rnd, norfolk_haz_rnd, illi_haz_rnd, con_haz_rnd)
)

ggplot(haz_dam_per_co,
       aes(x = reorder(Railroad_Company, avg_car_dam),
           y = avg_car_dam, fill = factor(Railroad_Company))) +
  geom_bar(stat = "identity") +
  labs(title = "Average Number of Hazmat Cars Damaged per Railroad Company", x = "Railroad Company", y = "Average Number of Hazmat Cars Damaged",
       fill = "Railroad Company") + 
  theme_minimal()

# Accidents per Year Total

accidents_per_year <- train_accident %>%
  group_by(`Report Year`) %>%
  summarize(Count = n()) %>%
  filter(Count > 1)

ggplot(accidents_per_year, 
       aes(x = `Report Year`, y = Count)) +
  geom_point(size = 2, shape = 19) +
  geom_smooth(method = "lm", se = FALSE, aes(group = 1)) +
  labs(
    title = "Count of Total Railroad Accidents Over the Years",
    x = "Accident Year",
    y = "Accident Count"
  ) +  
  theme_minimal()

# Accidents per Company

co_accidents_per_year <- train_accident %>%
  group_by(`Reporting Railroad Name`) %>%
  summarize(Count = n()) %>%
  filter(Count > 1)

top_co_acc <- co_accidents_per_year[order(co_accidents_per_year$Count, decreasing = TRUE), ]

# Union Pacific Accidents per Year

union_pacific_acc <- union_pacific %>%
  group_by(`Report Year`) %>%
  summarize(Count = n()) %>%
  filter(Count > 1)

ggplot(union_pacific_acc, 
       aes(x = `Report Year`, y = Count)) +
  geom_point(size = 2, shape = 19) +  
  geom_smooth(method = "lm", se = FALSE, aes(group = 1)) +
  labs(
    title = "Number of Union Pacific Accidents Over the Years",
    x = "Accident Year",
    y = "Accident Count"
  ) +  
  theme_minimal()
