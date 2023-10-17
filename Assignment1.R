### Introduction to Epidemiology Data Analysis with R

# Assignment 1:

# Calculate 3 + 2
3 + 2

# Calculate 6 + 10
6 + 10
  
# How would you get information on how to use the function "log"?
?log
help(log)
  
# Calculate the value for log 5
log(5)
  
# Assign the value 27 to the variable x
x <- 27

# Assign the value 5 to the variable y
y <- 5

# Multiply x by y
x * y

# Create the variable z that stores the result of this multiplication 
z <- x*y

# List all the object in your enviorment pane
ls()

# Calculate BMI ###########################################
# Body Mass Index (BMI) is a person’s weight in kilograms divided by the square of height in meters. 
# Person 1 weighs 90 Kg and their height is 1.90 meters. Write the formula to calculate their BMI:

90/sqrt(1.90)

# Try to calculate BMI for person 2 (height is 1.60 m, weighs = 80 Kg) using variables, and store the results in a variable called BMI  
h <- 1.60
w <- 80
  
BMI <- w/sqrt(h)
