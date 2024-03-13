# 1. MULTIPLE PREDICTORS
# load data
library(DAAG)
data(allbacks)
summary(allbacks)

# fit model
book_mir = lm(weight ~ volume + cover, data = allbacks)
summary(book_mir)


# 2. ADJUSTED R 
# load data
states = read.csv( "http://bit.ly/dasi_states")

# fit model
pov_slr = lm(poverty ~ female_house, data = states)
summary(pov_slr)

# fit model with more explanatory variables
pov_mlr = lm(poverty ~ female_house + white, data = states)
summary(pov_mlr)
anova(pov_mlr)


# 3. INFERENCE FOR MLR
# load data
cog = read.csv("http://bit.ly/dasi_cognitive")

# full model
cog_fm = lm(kid_score ~ mom_hs + mom_iq + mom_work + mom_age, data = cog)

# final model
cog_final = lm(kid_score ~ mom_hs + mom_iq + mom_work, data = cog)
summary(cog_final)

# 4. CHECK CONDITIONS
# Linear relationships between x(numerical) and y
plot(cog_final$residuals ~ cog$mom_iq)

# normally distributed with a mean of 0
hist(cog_final$residuals)
qqnorm(cog_final$residuals)
qqline(cog_final$residuals)

# constant variability of residuals
plot(cog_final$residuals ~ cog_final$fitted)
plot(abs(cog_final$residuals) ~ cog_final$fitted)

# independent residuals
plot(cog_final$residuals)
