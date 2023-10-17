# Assignment 6

# download the vaccine_distribution.csv file from the blackboard
library(tidyverse)
library(janitor)

# complete the code to import the dataset 
vaccine_distribution <- read_csv("vaccine_distribution.csv")

# clean the column names
vaccine_distribution <- vaccine_distribution %>% clean_names()

# mutate the tibble to calculate the total number of doses (1st + 2nd) per jurisdiction
vaccine_distribution %>% 
    mutate(total = first_dose_allocations + second_dose_allocations) %>% 
    group_by(jurisdiction) %>% 
    summarise(total_first = sum(first_dose_allocations),
              total_second = sum(second_dose_allocations))


# use summarise to calculate the average number and standard deviation 
# of first and second doses
vaccine_distribution %>% 
    summarise(mean_first = mean(first_dose_allocations),
              sd_first = sd(first_dose_allocations),
              mean_second = mean(second_dose_allocations),
              sd_second = sd(second_dose_allocations))

vaccine_distribution %>% 
    summarise(mean_first = mean(first_dose_allocations),
              sd_first = sd(first_dose_allocations),
              mean_second = mean(second_dose_allocations),
              sd_second = sd(second_dose_allocations))


# Use group to calculate the average of first, second and total doses per jurisdiction
vaccine_distribution %>% 
    group_by(jurisdiction) %>% 
    summarise(mean_first = mean(first_dose_allocations),
              mean_second = mean(second_dose_allocations),
              mean_total = mean(total))

# Count the number of vaccination weeks per jurisdiction
vaccine_distribution %>% 
    count(jurisdiction)


vaccine_distribution %>% 
    group_by(jurisdiction) %>% 
    count(week_of_allocations) %>% 
    summarise(sum(n))

## an alternative from responses
vaccine_distribution %>% 
    group_by(jurisdiction) %>%
    count(week_of_allocations) %>% 
    summarise(n_weeks=sum(n))

# Create a tibble 1 with the number of vaccination weeks per jurisdiction
tibble1 <- vaccine_distribution %>% 
    count(jurisdiction, name = "n_weeks")

# Create a tibble 2 with the total number of first and second doses per jurisdiction
tibble2 <- vaccine_distribution %>% 
    group_by(jurisdiction) %>% 
    summarise(total_first = sum(first_dose_allocations),
              total_second = sum(second_dose_allocations))
tibble2

# join tibble 1 and 2
full_join(tibble1, tibble2)


