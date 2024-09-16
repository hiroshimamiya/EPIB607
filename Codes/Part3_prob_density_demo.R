
# plot function borrowed from here 
#https://r-coder.com/normal-distribution-r/
 
#Another plot function - prob easier to use  
#https://homerhanumat.github.io/tigerstats/qnorm.html 
  
  #Our population, Z distribution 
  x <- seq(from =-10, to =10, by = 0.1)
  plot(x, dnorm(x), type = "l" , ylab = "f(x): normal output") #mena is set to zero, and sd is 1
  
  
  lines(x, dnorm(x, mean = 0, sd = 2), col = "blue", lty = 3, lwd = 1)
  
  lines(x, dnorm(x, mean = 0, sd = 3), col = "red", lty = 3, lwd = 1)
  
  





normal_area <- function(mean = 0, sd = 1, lb, ub, acolor = "lightgray", ...) {
  x <- seq(mean - 3 * sd, mean + 3 * sd, length = 100) 
  
  if (missing(lb)) {
    lb <- min(x)
  }
  if (missing(ub)) {
    ub <- max(x)
  }
  
  x2 <- seq(lb, ub, length = 100)    
  plot(x, dnorm(x, mean, sd), type = "n", ylab = "")
  
  y <- dnorm(x2, mean, sd)
  polygon(c(lb, x2, ub), c(0, y, 0), col = "lightblue")
  lines(x, dnorm(x, mean, sd), type = "l", ...)
}



normal_area(mean = 100, sd = 13, lb=130, ub=300, acolor = "lightgray")


pnorm(130, mean = 100, sd = 13, lower.tail = FALSE)


