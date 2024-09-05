# Binomial distribution, illustration. 

#NUmber of successes, K 1 to 100
k <- 1:100

# # of trials (n) in an experiment, and p
p <- 0.5; 
numTrials = 100

plot(dbinom(k, size = numTrials , prob = p), type = "h", lwd = 2,
     main = "Binomial probability function", ylim = c(0, 0.2), 
     ylab = "P(X = x)", xlab = "Number of successes out of 100 trials")

p <- 0.7; 
lines(dbinom(k, size = numTrials , prob = p), type = "h",
      lwd = 2, col = rgb(1,0,0, 0.7))

p <- 0.1; 
lines(dbinom(k, size = numTrials , prob = p), type = "h",
      lwd = 2, col = rgb(0, 1, 0, 0.7))

# Add a legend
legend("topright", legend = c("100 trials  p = 0.5", "100 trials  p = 0.7", "100 trials   p =0.1"),
       title = "trials        p", title.adj = 0.95,
       lty = 1, col = 1:3, lwd = 2, box.lty = 0)




