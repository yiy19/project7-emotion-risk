


require(haven)
require(tidyverse)

# read data
risk <- read_spss("data/risk_excluded.sav")


# create six data sets
# rel_self = yes & rel_friend1 = yes
# rel_self = no & rel_friend1 = no

single <- risk %>% 
  filter(rel_self == 2 & rel_friend1 == 2)
glimpse(single)

inrelationship <- risk %>% 
  filter(rel_self == 1 & rel_friend1 == 1)
glimpse(inrelationship)

# read data 
risk_sur <- read_spss("data/risk_sur.sav")
risk_pred <- read_spss("data/risk_pred.sav")

# create group variable
risk_sur <- risk_sur %>% 
  mutate(group = case_when(rel_self == 1 & rel_friend1 == 1 ~ 1,
                           rel_self == 2 & rel_friend1 == 2 ~ 2,
                           TRUE ~ 3)) %>% 
  filter(group %in% c(1, 2))

risk_pred <- risk_pred %>% 
  mutate(group = case_when(rel_self == 1 & rel_friend1 == 1 ~ 1,
                           rel_self == 2 & rel_friend1 == 2 ~ 2,
                           TRUE ~ 3)) %>% 
  filter(group %in% c(1, 2))

glimpse(risk_sur)
glimpse(risk_pred)

# write data
write_sav(single, "data/single.sav")
write_sav(inrelationship, "data/inrelationship.sav")
write_sav(risk_sur, "data/self_surrogate.sav")
write_sav(risk_sur, "data/self_prediction.sav")




