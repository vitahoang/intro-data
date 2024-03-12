library(statsr)
library(dplyr)
library(ggplot2)
data(kobe_basket)
kobe_streak <- calc_streak(kobe_basket$shot)

coin_outcomes <- c("heads", "tails")
sample(coin_outcomes, size = 1, replace = TRUE)
sim_fair_coin <- sample(coin_outcomes, size = 100, replace = TRUE)
sim_fair_coin
table(sim_fair_coin)
sim_unfair_coin <- sample(coin_outcomes, size = 100, replace = TRUE, 
                          prob = c(0.2, 0.8))

shot_outcomes <- c("H", "M")
sim_basket <- sample(shot_outcomes, size = 133, replace = TRUE, prob = c(0.45, 0.55))
table(sim_basket)
sim_streak <- calc_streak(sim_basket)
ggplot(sim_streak, aes(x = length))+
  geom_histogram(binwidth = 1)