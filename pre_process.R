setwd('C:/Users/Jason/Desktop/Cours/M2/Machine_learning/Supervised_learning/Assignment')

library(data.table)
library(dplyr)

data <- fread('data_assignment_1.csv')


# get distribution of available years
hist(data$year, freq = FALSE)
lines(density(data$year))

# add growth column
data <- data %>% group_by(id) %>% mutate(growth = (sales - lag(sales))/lag(sales))


# drop NA
data_complete <- data[complete.cases(data),]


# get distribution of available years
hist(data_complete$year, freq = FALSE)
lines(density(data_complete$year))
