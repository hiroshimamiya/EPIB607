---
title: "Normal_ProbDensityFunction_practice"
author: "H"
date: "2024-09-13"
output: html_document
---


  
  
This document describes how to calucate proabbility and the range of continous random variablea will be provided using *pnorm* and *qnorm* functions in Rstudio. 
We will work on the two key tasks in this course   

1) How to get area (probability) under the curve, if you are asked to calcuate this basedon the range of X    
  e.g. what proportion of people fail under the height between $a <= X <= b$ ?    
  *Inputs you are given*: range, or the values of a and b
2) How to get the value of X (your outcome range e.g., hight, or value of standard deviation describin your curve)   
  e.g., what is the range of height (values of a and b) which that $p$% people fall?    
  *Inputs you are given*: probability (denstiy, or area under the curve) 

Often you are rpovdied with the location and spread of your normal distribution $\mu$ and $\sigma^2$, and if not, you will be instructed to assume $\mu=0$ and $\sigma^2=1$


First, make a tiny program that draw and paint probability density function - you will study how to make this in "Write your own functions" moduel in EPIB613
```{r }
normal_area <- function(mean = 0, sd = 1, lb, ub, acolor = "lightgray", main , ...) {
  x <- seq(mean - 3 * sd, mean + 3 * sd, length = 100) 
  
  if (missing(lb)) {
    lb <- min(x)
  }
  if (missing(ub)) {
    ub <- max(x)
  }
  
  x2 <- seq(lb, ub, length = 100)    
  plot(x, dnorm(x, mean, sd), type = "n", ylab = "", main = main)
  
  y <- dnorm(x2, mean, sd)
  polygon(c(lb, x2, ub), c(0, y, 0), col = "lightblue")
  lines(x, dnorm(x, mean, sd), type = "l", ...)
}
```


```{r}
# Demo 
par(mfrow = c(1, 3))
normal_area(mean = 130, sd = 10, lb = 0, ub = 150, main = "P(X <= 150)")
normal_area(mean = 130, sd = 10, lb = 0, ub = 120,  main = "P(X <= 120)")
normal_area(mean = 130, sd = 10, lb = 120, ub = 150, main =  " P(120 <= X <= 150)" )
dev.off()
```



```{r}
par(mfrow = c(1, 3))
normal_area(mean = 0, sd = 1, lb = -5, ub =  0.5, main = "P(X <= 0.5)")
normal_area(mean = 0, sd = 1, lb = -5, ub = -0.5,  main = "P(X > 0.5 )")
normal_area(mean = 0, sd = 1, lb = -0.5, ub = 0.5, main =  " P(-0.5 <= X <= 0.5)" )
dev.off()
```


```{r}
par(mfrow = c(1, 3))
myMean = 100; mySd= 20
qnorm(mean = myMean, sd = mySd, p =  0.995)
qnorm(mean = myMean, sd = mySd, p =  0.005)
normal_area(mean = myMean, sd = mySd, lb = 0, ub =  151.5, main = "P(X <= 0.095)")
normal_area(mean = myMean, sd = mySd, lb = 0, ub = 48,  main = "P(X > 0.05 )")
normal_area(mean = myMean, sd = mySd, lb = 48, ub = 151, main =  " P(-0.05 <= X <= 0.095)" )
dev.off()
```


```{r}
par(mfrow = c(1, 2))
myMean = 30000; mySd= 2500
1-pnorm(mean = myMean, sd = mySd, q=37500)
normal_area(mean = myMean, sd = mySd, lb = 0, ub =  37500, main = "X <= 37500")
normal_area(mean = myMean, sd = mySd, lb = 37500, ub =  40000, main = "X > 37500 (so tiny...)")
dev.off()
```





```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
