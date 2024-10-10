






#Sample size, exercise 2 
pwr::pwr.norm.test(d = 15/15, power = 0.8, sig.level = 0.05, alternative = "two.sided")
pwr::pwr.norm.test(d = 15/15, power = 0.8, sig.level = 0.05, alternative = "greater")


#Manual calculation for the sample size
Za1 = qnorm(mean = 0, sd = 1, p = 0.975) # two sided
Za2 = qnorm(mean = 0, sd = 1, p = 0.95) #one sided
Zb = qnorm(mean = 0, sd = 1, p = 0.8) 
sigma = 15
effect = 15

((Za + Zb)^2 * sigma^2)/(effect^2)


