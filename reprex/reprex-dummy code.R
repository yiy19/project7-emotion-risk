
# libraries
library(lavaan)
library(tidyverse)

# model
self_sur_mediation <- '
    # direct effect
    risklevel ~ b1 * neg + b2 * pos + b3 * alert + c * condition_sur
    # mediator
    neg ~ a1 * condition_sur
    pos ~ a2 * condition_sur
    alert ~ a3 * condition_sur
    # indirect effect (a*b)
    indirect1 := a1 * b1
    indirect2 := a2 * b2
    Indirect3 := a3 * b3
    # total effect
    total := c + (a1 * b1) + (a2 * b2) + (a3 * b3)
    # covariances
    neg ~~ pos
    pos ~~ alert
    neg ~~ alert
'
fit <- sem(model = self_sur_mediation, data = risk_final, se = "bootstrap", bootstrap = 5000)
summary(fit)