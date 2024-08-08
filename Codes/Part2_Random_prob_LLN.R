
# Uncomment below to get same results everytime 
#set.seed(111)

# Generate toss by two people 
tosses_byHiroshi <- sample(c("head", "tail"), size = 3000, replace = TRUE)
tosses_byYou<- sample(c("head", "tail"), size = 3000, replace = TRUE)

# Plot cumulative sum over the number of toss
plot(y=cumsum(tosses_byHiroshi == "head") / (1:length(tosses_byHiroshi)), 
	x = 1:length(tosses_byHiroshi), 
     type = "l", ylim = c(0,1),  
	col = "green", 
     main = "Coin tosses- demontrating randomness and probability \n 
Proportion of heads over trials at nth flip", 
     xlab = "Number of tossess", ylab = "Proportion of heads")

# Add horizontal straight line
abline(h = 0.5, col = "grey")

# Add cumulative proportion again 
lines(y=cumsum(tosses_byYou == "head") / (1:length(tosses_byYou)), 
	x = 1:length(tosses_byYou), col = "red")

legend("topright", legend=c("My trials", "Your trials"),
       col=c("green", "red"), lty = c(1,1))






