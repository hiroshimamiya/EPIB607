
# plto function borrowed from here 
#https://r-coder.com/normal-distribution-r/
 
#Another plot function - prob easier to use  
#https://homerhanumat.github.io/tigerstats/qnorm.html 
  
  #Our population, Z distribution 
  x <- seq(from =-10, to =10, by = 0.1)
  plot(x, dnorm(x), type = "l" , ylab = "f(x): normal output") #mena is set to zero, and sd is 1
  
  
  lines(x, dnorm(x, mean = 0, sd = 2), col = "blue", lty = 3, lwd = 1)
  
  lines(x, dnorm(x, mean = 0, sd = 3), col = "red", lty = 3, lwd = 1)
  
  
  
  
  
  
  
  # Example, height from hypthetical population 
  muH= 150 
  sigmaH = 20
  maxHeight = 220 
  minHeight = 75
  x <- seq(from =minHeight, to =maxHeight, by = 0.1)
  y <- dnorm(x, mean = muH, sd = sigmaH)
  
  plot(x, y, type = "l" , 
       ylab = "f(x): normal output", 
       xlab = "height in cm",
       main = paste("Mu and sigma are", muH,":" ,sigmaH))
  ) #mena is set to zero, and sd is 1


pnorm(130, mean = muH, sd = sigmaH, lower.tail = F)
pnorm(130, mean = muH, sd = sigmaH, lower.tail = T)


normal_area(mean = muH, sd = sigmaH, lb = 130, ub =300)
normal_area(mean = muH, sd = sigmaH, lb = 0, ub =130)


qnorm(0.5, mean = 150, sd = sigmaH)








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

