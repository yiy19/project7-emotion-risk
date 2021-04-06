## libraries
library(tidyverse)
library(reprex)


## reproducible data

data1 <- data_frame(
  femsel_risk = round(runif(300, min = 0, max = 7), 0),
  femsel_pos = round(runif(300, min = 0, max = 4), 0),
  femsel_neg = round(runif(300, min = 0, max = 4), 0),
  condition_femsel = 1,
  id = 1:300
)

data2 <- data_frame(
femsur_risk = round(runif(300, min = 0, max = 7), 0),
femsur_pos = round(runif(300, min = 0, max = 4), 0),  
femsur_neg = round(runif(300, min = 0, max = 4), 0),
condition_femsur = 1,
id = 301:600
)

# things that didn't work
# data <- merge(data1, data2, by = "id")
# data_c <- union(data1, data2)

data <- bind_rows(data1, data2)


### the dataset I want
data_ideal <- data_frame(
  risk = round(runif(300, min = 0, max = 7), 0),
  pos = round(runif(300, min = 0, max = 4), 0),
  neg = round(runif(300, min = 0, max = 4), 0),
  condition = round(runif(300, min = 0, max = 1), 0)
)

