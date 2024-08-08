cdf


The probability that an adult male will be 6 feet tall or shorter is 0.853745. Equivalently, you can say that a 6’ tall adult male is at the 85.4th percentile.

X = rnorm(1000) # X is a sample of 100 normally distributed random variables

P = ecdf(X)    # P is a function giving the empirical CDF of X
P(0.0)         # This returns the empirical CDF at zero (should be close to 0.5)
plot(P)        # Draws a plot of the empirical CDF (see below)


z = seq(-3, 3, by=0.001)
p = P(z)

class(P)




#Normal PDF
qnorm(0.9,mean = 100, sd = 13, lower.tail = TRUE)
qnorm(0.9894919,mean = 100, sd = 13, lower.tail = TRUE)
pnorm(130,mean = 100, sd = 13, lower.tail = TRUE)
pnorm(130,mean = 100, sd = 13)



#Expoenntial , demo for CLT 
#https://rpubs.com/MLivingstone/CourseraInferentialStatsP1
meanE = 8 
rateE <- 1/meanE
nSim = 100
n = 100
sampD <- matrix(nrow = n, ncol = nSim)
for(i in 1:nSim){
 sampD[, i] <- rexp(n, rate = rateE)
}

hist(colMeans(sampD))
mean(colMeans(sampD))
sd(colMeans(sampD))

