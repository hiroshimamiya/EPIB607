# Regression example 


# Make compariosn plots 
par(mfrow= c(1,2))

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






# I make fake state-level cigarette sales and lung cancer rate per 100,000 ppl
Cigarette <- abs(rnorm(mean = 0, sd = 8, n = 50)) + 10
CancerRate <- 0*Cigarette + rnorm(sd = 3, n = 50) + 15

plot(Cigarette, CancerRate, pch = 16,  main = "Slope coefficient is zero", ylim = c(3, 40))
abline(a= mean(CancerRate), b = 0,col = "black")
