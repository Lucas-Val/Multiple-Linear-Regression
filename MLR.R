# loading and exploring the data
adv = read.csv("Advertising.csv")
dim(adv)
names(adv)
sapply(adv, class)
str (adv)
class(adv)
head(adv)

# Matrix scatter plot 
pairs(adv, panel = panel.smooth)

# Covariance matrix
cov(adv)

# Correlation matrix
cor(adv)

# Multiple linear regression model
model1 = lm(Sales ~ . , data = adv)
model1
summary(model1)

# New model with only significant variables 
model2 = lm(Sales ~ . - Newspaper, data = adv)
model2
summary(model2)
anova(model2)

# Predicted variables
model2$fitted.values

# Residuals
model2$residuals

# Plotting residual vs fitted plot
plot(model2$fitted, model2$residuals, xlab = "Fitted values",
     ylab = "Resdiduals"
     )

# Model diagnostic plots
par(mfrow = c(2,2))
plot(model2)

par(mfrow = c(1,1))
hist(model2$residuals)

# Adding the interaction term
model3 = lm(Sales ~ TV + Radio + TV*Radio, data = adv)
model3
summary(model3)

# Polynomial reggression 
model4 = lm(Sales ~ TV + I(TV*TV) + I(TV*TV*TV), data = adv)
model4
summary(model4)
