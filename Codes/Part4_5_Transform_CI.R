
# Part 4-2
# Log transformation of continous varaible with outliers 



# Preperation - Create income varialbe from beta distribution 
# INCOME 
m = 30
v = 700
sig2 = log(v + m^2) - 2*log(m)
mu = log(m) - sig2 / 2 
income = exp(rnorm(1000, mu, sqrt(sig2)))






# Check mean and median of the original and log transformed variable
mean(income)
median(income)

Log_Income <- log(income)

mean(Log_Income)
median(Log_Income)

par(mfrow = c(1,2))
hist(income, main = "income in k, \n mean = 30,\n median = 22")
hist(Log_Income, main = "log income in k, \n mean = 3.11,\n median = 3.11")
par(mfrow = c(1,1))


median(exp(Log_Income))
exp(median(Log_Income))


mean(exp(Log_Income))
exp(mean(Log_Income))


#Confidence Interval 
se <- {sd(Log_Income)/sqrt(1000)}
mean(Log_Income) + qt(df = 1000-1, p = 0.975)*se
mean(Log_Income) - qt(df = 1000-1, p = 0.975)*se





