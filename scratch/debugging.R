install.packages("reprex")
library(reprex)

reprex({
  library(palmerpenguins)
  body_condition <- resid(lm(body_mass_g ~ flipper_length_mm, penguins))
  summary(body_condition)
})

#debugging
##small and simple inputs
##no extraneous packages
##no unnecessary function calls

reprex({
  # Load some packages
  library(lubridate) #CUT
  library(nlme) #CUT
  library(palmerpenguins)
  library(tidyverse)
  
  # Define some functions
  
  # Body condition index (residual of body mass on structural size e.g. flipper or bill length)
  bci <- function(mass, structural_size) {
    browser()
    resid(lm(mass ~ structural_size))
  }
  
  # Start manipulating data
  penguins %>% 
    group_by(species, island) %>% 
    summarize(n = sum(!is.na(body_mass_g)),
              mean_mass_g = mean(body_mass_g),
              sd_mass_g = sd(body_mass_g),
              bci_flipper = bci(body_mass_g, flipper_length_mm),
              bci_bill = bci(body_mass_g, bill_length_mm),
              .groups = "drop")
})

df <- data.frame(a = c("J", "J", "M", "M"), x = 1:4, y = 1:4) #dummy data frame

df %>%
  group_by(a) %>% 
  summarize(bci_xy = bci(x,y),
            .groups = "drop")
