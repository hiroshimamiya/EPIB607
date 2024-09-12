
# Part2-2. Discrete, binomial distribution. 
# Vaping example 
# Probability of population - vapint 

P_vape_pop <- 1145/4583
P_vape_pop

# Now, your sample and observed (realized) outcome event, k = 6, out of n=10 sample size 
dbinom(x = 6, size = 10, prob = P_vape_pop)

# and from 0 to 6 vaping outcomes 
dbinom(x = 0:10, size = 10, prob = P_vape_pop)


plot(dbinom(x = 0:10, size = 10, prob = P_vape_pop), ylab = "P(X=x)", type = "h", main = "probability distribution of vaper among 10 students interviewed \n 
     this is not bargraph, but histogram")

#so, how likely is this obsevation of X=>6? if the prevalence of vaping is truly 25%? 

# sum to 1, obviously 
sum(dbinom(x = 0:10, size = 10, prob = P_vape_pop))

# add up P(X>5)
dbinom(x = 0:10, size = 10, prob = P_vape_pop)



