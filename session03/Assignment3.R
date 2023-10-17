# Assignment 3


## Consider the following vector with blood glucose measurements (mg/dL)
## from a patient during a week
blood_glucose <- c(99, 98, 100, 97, 101, 110, 109)

### Write the code to remove the fifth measurement
blood_glucose[-5]
blood_glucose

blood_glucose <- blood_glucose[-5]
blood_glucose

### Add a new measurement at the end of the vector
blood_glucose[7] <- 99
blood_glucose

### Replace the third measurement with 102
blood_glucose[3] <- 102
blood_glucose

### Use a logical evaluation to replace all measurements 
### less or equal to 99 and replace them with the word "normal"
blood_glucose <= 99
blood_glucose[blood_glucose <= 99]

blood_glucose[blood_glucose <= 99] <- "normal"
blood_glucose

## Which function is used to represent tabular data in R? 
## Choose one of the above options:
# a) character()
# b) c()
# c) data.frame() X
# d) list()


## Consider the following data frame with the percentage of 
## patients with diabetes from 2015 to 2019

diabetes_perc <- data.frame(
    year = c(2015, 2016, 2017, 2018, 2019),
    age_18_44 = c(2.2, 2.8, 2.7, 3.3, 2.4),
    age_45_64 = c(12.8, 12.1, 12.7, 12.4, 12.2),
    age_65_74 = c(22.1, 22.0, 19.1, 21.4, 19.5),
    age_75_more = c(21.2, 18.6, 19.0, 21.8, 20.7)
)

### How many rows and columns does the data frame have?
dim(diabetes_perc)

nrow(diabetes_perc)
ncol(diabetes_perc)

### Select the percentage of people from 65 to 74 years old
### diagnosed with diabetes in 2017
diabetes_perc[3, 4]

### Select the percentage of people from 18 to 44 years old
### diagnosed with diabetes from 2017 to 2019
diabetes_perc[3:5, 2]

### Select the percentage of people diagnosed with diabetes
### in 2016 for all ages
diabetes_perc[2,]


