# Assignment 7

# download the vaccine_distribution.csv file from the blackboard. 

library(tidyverse)
library(ggplot2)

# import the dataset 
vaccine_distribution <- read_csv("vaccine_distribution.csv")

vaccine_distribution
# create a new column with the total number of doses (1st + 2nd)
vaccine_distribution <- vaccine_distribution %>% 
    mutate(total = first_dose_allocations + second_dose_allocations)

# plot a histogram to observe the distribution of the total dose allocations. 
# Play with the number of bins or the binwidth to get a better visualization
ggplot(vaccine_distribution, aes(x = total)) +
    geom_histogram(bins = 100)

ggplot(vaccine_distribution, aes(x = total)) +
    geom_histogram(binwidth = 10000)

# create a dot plot to compare the number of first dose allocations vs second dose allocations
ggplot(vaccine_distribution, aes(x = first_dose_allocations, y = second_dose_allocations)) +
    geom_point()

# create a boxplot to observe the distribution of first dose allocations per jurisdiction
ggplot(vaccine_distribution, aes(x = first_dose_allocations, y = jurisdiction)) +
    geom_boxplot()

# Use tidyverse functions to calculate the average number of total doses per jurisdiction, 
# then use the result to create a dot plot comparing the average number of doses vs jurisdiction
avg_jurisdiction <- vaccine_distribution %>% 
    group_by(jurisdiction) %>% 
    summarise(mean = mean(total))
avg_jurisdiction

ggplot(avg_jurisdiction, aes(x = mean, y = jurisdiction)) +
    geom_point()

