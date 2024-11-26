# Regression example 


# Make compariosn plots 
rm(list=ls())
par(mfrow= c(1,2))

set.seed(101)

# I make fake state-level cigarette sales and lung cancer rate per 100,000 ppl
Cigarette <- abs(rnorm(mean = 0, sd = 8, n = 50)) + 10
CancerRate <- Cigarette + rnorm(sd = 3, n = 50) + 3

# Wild guess, beta_0 = 0, and beta_1 = 1
plot(Cigarette, CancerRate, pch = 16,  main = "wild guess, biased")
abline(a= 0, b = 1,col = "black")

# Estimated from data 
plot(Cigarette, CancerRate, main = "Correctly estimated (unbiased) parameters")
abline(lm(CancerRate ~ Cigarette),col = "black")
lm(CancerRate ~ Cigarette)$coefficients






#

# Least square estimation 
# Beta_1
SS_xy <- sum((Cigarette - mean(Cigarette))*(CancerRate - mean(CancerRate))) 
SS_xx <- sum((Cigarette - mean(Cigarette))^2)
SS_xy/SS_xx 
beta_1 <- SS_xy/SS_xx 

# Beta_0
mean(CancerRate) - beta_1*mean(Cigarette)
beta_0 <- mean(CancerRate) - beta_1*mean(Cigarette)

# Confirm by a regression function 
lm(CancerRate ~ Cigarette)

 









# Centering to improve the interpretation of \beta_0
# Beta_1
Cigarette_C <- Cigarette - mean(Cigarette)
SS_xy <- sum((Cigarette_C - mean(Cigarette_C))*(CancerRate - mean(CancerRate))) 
SS_xx <- sum((Cigarette_C - mean(Cigarette_C))^2)
SS_xy/SS_xx 
beta_1_C <- SS_xy/SS_xx

# Beta_0
mean(CancerRate) - beta_1_C*mean(Cigarette_C)
beta_0_C <- mean(CancerRate) - beta_1*mean(Cigarette_C)


par(mfrow= c(1,2))
# Wild guess, beta_0 = 0, and beta_1 = 1
plot(Cigarette, CancerRate, pch = 16,  main = "Original data ", xlim = c(0,30))
abline(a= beta_0, b = beta_1,col = "black")

# After centring 
plot(Cigarette_C, CancerRate, main = "x is centered", xlim = c(-10,20))
abline(a = beta_0_C, b = beta_1_C,col = "black")












# Prediction interval:  group and individual level prediction 
# make plot window
par(mfrow = c(1,1))

# Fit OLS and store fit into a "fit" variable
fit <- lm(CancerRate ~ Cigarette)

# Make a prediction at x = 10, for CI and prediction Interval 
# see lwr and upr for the lower and upper range 
predict(fit, newdata = data.frame(Cigarette = 10), interval = "confidence", se.fit = T)
predict(fit, newdata = data.frame(Cigarette = 10), interval = "prediction", se.fit = T)


# make a large number of hypothetical x to make lots of prediction 
n_data <- data.frame(Cigarette = seq(min(Cigarette), max(Cigarette), by=0.1))
conf_int <- predict(fit, newdata=n_data,  interval='confidence', level=.95)
pred_int <- predict(fit, newdata=n_data,  interval='prediction', level=.95)


# plot prediction at all range 
plot(x = Cigarette, y = CancerRate, pch=20, cex=1, col="blue", 
     xlab="CigaretteRate", ylab="CancerRate", 
     main="Prediction \n Confidence intervals and prediction intervals")
abline(fit, lwd=2, col="red")
matlines(n_data, conf_int[, 2:3], lty='dashed', col="red", lwd=2)
matlines(n_data, pred_int[, 2:3], lty='dashed', col="green", lwd=2)
legend('topleft', legend=c('conf_int', 'pred_int'), col=c("red", "green"),
       lty=2, lwd=2)



#SE : manual calculation
fit <- lm(CancerRate ~ Cigarette)
# Sum of ssqured x
SS_xx <- sum((Cigarette - mean(Cigarette))^2)
# degrees of freedom 
df <- length(CancerRate)-2
# standard deviation of Y 
sigma <- sqrt(sum((CancerRate - fit$fitted.values)^2)/(df))
# Mean of x 
xbar <- mean(Cigarette)
SE_conf <- (sigma)*sqrt(1/length(Cigarette) + ((10 - xbar)^2/SS_xx))
SE_pred <- (sigma)*sqrt(1 + 1/length(Cigarette) + ((10 - xbar)^2/SS_xx))












# Extra materials, log transformation of x  ########################
# Log transformation, base 10(Y).  
dev.off()
plot(y=log10(1:10000), x =1:10000, type = "l")
abline(h = 1); abline(h = 2); abline(h = 3);

# Log transformation, base 10(Y).
dev.off()
par(mfrow= c(2,2))
hist(CancerRate); hist(log10(CancerRate))
plot(y = log10(CancerRate), Cigarette, main = "transformed y" )
plot(y = CancerRate, Cigarette, main = "original y")


fit <- lm(log10(CancerRate) ~ Cigarette)
plot(y = 10^fit$fitted.values, x = Cigarette, main = "Y converted back to non-log scale")







# Log transformation, base 2(X).  
dev.off()
par(mfrow= c(2,2))
plot(log2(Cigarette), CancerRate, pch = 16,  main = "Log2(x), X is scaled")
abline(lm(CancerRate ~ log2(Cigarette)),col = "black")

plot(Cigarette, CancerRate, pch = 16,  main = "x")
abline(lm(CancerRate ~ Cigarette),col = "black")



plot(y=log2(Cigarette), x =Cigarette)
abline(h = 3.5)
abline(v = 2^(3.5))
abline(h = 4.5)
abline(v = 2^(4.5))
2^3.5 # y-axis
2^4.5 # y-axis, increment of log2 x by one 
















