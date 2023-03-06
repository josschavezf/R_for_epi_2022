# Session 07 

# Link https://josschavezf.github.io/R_for_epi/session07/session07.html

# install.packages("ggplot2")

library(tidyverse)
library(janitor)

# library(ggplot2)

sinai_covid <- read_csv("sinai_covid.csv")

sinai_covid <- sinai_covid %>% 
    clean_names()

sinai_covid

ggplot(sinai_covid, 
       aes(x = age, y = systolic_bp)) +
    geom_point()

ggplot(sinai_covid, aes(x = age)) +
    geom_histogram(binwidth = 1)

ggplot(sinai_covid, aes(x = sex)) +
    geom_bar()

ggplot(sinai_covid, aes(x = systolic_bp)) +
    geom_histogram(binwidth = 2)

ggplot(sinai_covid, aes(x = smoking_status)) +
    geom_bar()

ggplot(sinai_covid, aes(x = systolic_bp, y = diastolic_bp)) +
    geom_point()

ggplot(sinai_covid, aes(x = facility, y = age)) +
    geom_point()

ggplot(sinai_covid, aes(x = facility, y = age)) +
    geom_boxplot()

ggplot(sinai_covid, aes(x = age, y = facility)) +
    geom_boxplot()

ggplot(sinai_covid, aes(age, bmi)) +
    geom_point()

ggplot(sinai_covid, aes(bmi, facility)) +
    geom_boxplot()

ggplot(sinai_covid, aes(facility, bmi)) +
    geom_boxplot() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))



