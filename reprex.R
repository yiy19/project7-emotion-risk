## libraries
library(tidyverse)
library(reprex)


## reproducible data

data1 <- data_frame(
  femsel_risk = round(runif(1000, min = 0, max = 7), 0),
  femsel_pos = round(runif(1000, min = 0, max = 4), 0),
  femsel_neg = round(runif(1000, min = 0, max = 4), 0),
  condition_femsel = 1,
  id = 1:1000
)

data2 <- data_frame(
femsur_risk = round(runif(1000, min = 0, max = 7), 0),
femsur_pos = round(runif(1000, min = 0, max = 4), 0),  
femsur_neg = round(runif(1000, min = 0, max = 4), 0),
condition_femsur = 1,
id = 1001:2000
)

# things that didn't work
# data <- merge(data1, data2, by = "id")
# data_c <- union(data1, data2)

data <- bind_rows(data1, data2)


