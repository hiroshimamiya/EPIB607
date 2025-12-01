

# Cell count 
a <- 7
b <- 72
c <- 2
d <- 39

# Risks 
r1 <- a/(a+b)
r2 <- c/(c+d)
# Ratios 
RR <- r1/r2
OR <- (a*d) /(b*c) 
RR
OR


# Manual computation 
exp(log(OR) -1.96 * sqrt(1/a + 1/b + 1/c + 1/d))
exp(log(OR) + 1.96 * sqrt(1/a + 1/b + 1/c + 1/d))


# Manual computation 
exp(log(OR) -1.96 * sqrt(1/a + 1/b + 1/c + 1/d))
exp(log(OR) + 1.96 * sqrt(1/a + 1/b + 1/c + 1/d))




# Software solution 
library(epitools)
oddsratio(c(a,b,c,d), rev = "b") # you need to tell that the exposure and outcome is flipped from what this command expects
# Software solution 
riskratio(c(a,b,c,d), rev = "b")











# Cell count 
a <- 45
b <- 34
c <- 8
d <- 33

# Risks 
r1 <- a/(a+b)
r2 <- c/(c+d)
# Ratios 
OR <- (a*d) / (b*c) 
RR <- r1/r2
OR
RR

oddsratio(c(a,b,c,d), rev = "b")
riskratio(c(a,b,c,d), rev = "b")


oddsratio(c(a,b,c,d), rev = "b") # you need to tell that the exposure and outcome is flipped from what this command expects




# MacNemer 
> sum(dbinom(18:22, prob = 0.5, size = 22) )
[1] 0.002171755