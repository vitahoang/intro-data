# Multiple predictors
# load data
library(DAAG)
data(allbacks)
summary(allbacks)

# fit model
book_mir = lm(weight ~ volume + cover, data = allbacks)
summary(book_mir)


# Adjusted R 
# load data
states = read.csv( "http://bit.ly/dasi_states")

# fit model
pov_slr = lm(povery ~ female_house, data = states)

