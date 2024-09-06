# Exampple linear transformation, Part 1 (descriptive) - 2. 

# Hypothetical height distribution, in centimeter. Mean is 160 cm and sd (standard deviation ) is 15. A sample of 1000 people from a hypothetical population of a few million
# these are artificial (simulated) data, and you will know how to use this function in R in "Probability" module of EPIB613
x <- rnorm(n = 1000, mean = 160, sd = 15)


# Histogram of x variable
hist(x, main = "Height, mean = 160, sd = 15")


# New variable called x_inch, transformed from centimeter to inch 
x_inch <- x*0.39
hist(x_inch, main = "Heigh in inch, mean =? and sd= ?, \n compare x-axis the original x")


# Now lets check how the mean and sd of x changed, when you multipleied with the constant 
mean(x)
mean(x_inch)

sd(x)
sd(x_inch) # was it multiplied by 0.39 ?



# It turned out that the ruler to measure the hight was not accurate but was designed to report 1 inch lower than it shoud be, so we need to add 1 inch to everyone's height now 
x_inch_correct <- x_inch + 1

# Dispalying the histogram
hist(x_inch_correct, main = "Mean (center) has been shifted by 1 inch now \n but the width did not change")

# mean has now shifted, since everyone got 1 inch taller 
mean(x_inch)
mean(x_inch_correct)


# How about SD? does adding a value (as opposed to multiplying) change the spread of the distribution? 
sd(x_inch)
sd(x_inch_correct)

