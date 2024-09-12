
# Part 2-3 Normal Distribution function 
# Function for normal distribution - how to create function? See EPIB613 - User defined function 
normal_function <- function(x , mu , sigma){
  constant <- (1/(sigma*sqrt(2*pi)))
  exponent <- exp(-((x - mu)^2) / (2 * sigma^2))
  return(constant * exponent)
}


mu = 160
sigma = 15
x <- 160


# My own normal function, same as dnorm 
normal_function(x, mu, sigma)
dnorm(mean = mu, sd = sigma, x=160)


plot(normal_function(100:220, mu, sigma),  type = "l", xlab = "X", ylab = "f(x) : dnorm()", main="probability distribution: normal distribution 
     mu = 160, sd = 15")

