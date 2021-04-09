
### libraries
library(tidyverse)
library(reprex)
library(lavaan)


### the dataset I want
df <- data_frame(
  risklevel = round(runif(300, min = 0, max = 7), 0),
  pos = round(runif(300, min = 0, max = 4), 0),
  neg = round(runif(300, min = 0, max = 4), 0),
  alert = round(runif(300, min = 0, max = 4), 0),
  condition = as.factor(round(runif(300, min = 0, max = 2), 0))
)

df <- df %>% 
  mutate(condition = fct_recode(condition, Self = "0", Surrogate = "1", Prediction = "2"))
  


