library(corrplot)
library(GGally)
library(car)

# Create covariates

n <- 100
set.seed(12345)
lm_data <- data.frame(V1 = rnorm(n, 0, 1))
lm_data$V2 <- rcauchy(n, 0, 0.5)  # Random sample from Cauchy(0,0.5) distribution and potential outliers
lm_data$V3 <- rnorm(n, 0, 2)  # Random sample from Normal(0,1) distribution
lm_data$V4 <- runif(n, 0, 4)  # Random sample from Uniform(0,4) distribution 
lm_data$V5 <- runif(n, 0, 4)  # Random sample from Uniform(0,4) distribution
lm_data$V6 <- 0.4 * lm_data$V3 + rnorm(n, 0, 1)  # Creating Correlated exposures

lm_data

# Create an outcome

n <- 100
set.seed(12345)
lm_data$outcome_h <- lm_data$V1 + 0.5 * lm_data$V2 + (lm_data$V4)^2 + lm_data$V5 +
    rnorm(n, 0, 5)

# Correlation plot of the data

corrplot::corrplot(cor(lm_data)) # blue for positive correlation and red for negative correlation

# V6 x V3 shows an unexpected correlation and we need to be aware of this and remove it

# Pairs plot

GGally::ggpairs(lm_data)

# V2 x V2 shows an unexpected peak, we need to smooth it later
# V4 x V4 shows two peaks, which is no normal
# V5 x V5 shows a platted curve, which is no normal

# Build a linear regression model

linearMod <- lm(outcome_h ~ V1 + V2 + V3 + V4 + V5 + V6, data = lm_data)
summary(linearMod)

linearMod

# Tackle multi-collinearity with Variance Inflation Factor (vif)

vif(linearMod)

## high values indicate a multicollinearity problem

# Build a linear regression model after excluding the correlated variable

linearMod_1 <- lm(outcome_h ~ V1 + V2 + V3 + V4 + V5, data = lm_data)

summary(linearMod_1)

vif(linearMod_1) # much better

# Check for Non-linearity between Outcome and covariates (component-plus-residual plot)

crPlots(linearMod_1)

## the pink line shows the distribution
## the blue line indicates the expected distribution
## the differences between pink and blue lines could reflect some problems

# Refit the model including the quadratic term

linearMod_2 <- lm(outcome_h ~ V1 + V2 + V3 + I(V4^2) + V5, data = lm_data)
summary(linearMod_2)

## note: the I before V4^2 is need so that R understands the quadratic, 
## if not provided, it will be treated as regular V4

# Use the previous model

linearMod_1 <- lm(outcome_h ~ V1 + V2 + V3 + V4 + V5, data = lm_data)
summary(linearMod_1)

# Linearity of the data
# The linearity assumption can be checked by inspecting the Residuals vs Fitted plot

plot(linearMod_1, 1)

# Homogeneity of variance
# This assumption can be checked by examining the scale-location plot, also known as the spread-location plot

plot(linearMod_1, 3)

# Normality of residuals/ Outliers

plot(linearMod_1, 2)

## the x axis shows the expected
## y axis shows the observed values, ideally should not be so far from expected

# Influential values

plot(linearMod_1, 4)

# Exclude the outliers and influential observations and add the quadratic term

linearMod_2 <- lm(outcome_h ~ V1 + V2 + V3 + I(V4^2) + V5, data = lm_data[-c(47,
                                                                             89, 93, 98), ])

## the list of 47, 89, 93 and 98 are the excluded observations

summary(linearMod_2)

## other note: you can use the glm for non continuous linear model




