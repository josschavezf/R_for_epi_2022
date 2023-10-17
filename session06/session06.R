# Session 06 

# Link https://josschavezf.github.io/R_for_epi/session06/session06.html

library(tidyverse)
library(janitor)

sinai_covid <- read_csv("sinai_covid.csv")

View(sinai_covid)

sinai_covid <- sinai_covid %>% 
    clean_names()

sinai_covid

sinai_covid %>% 
    summarise(mean(age))

sinai_covid %>% 
    summarise(mean_age = mean(age),
              sd_age = sd(age))


sinai_covid %>% 
    summarise(median_age = median(age),
              max_age = max(age),
              min_age = min(age))


sinai_covid %>% 
    group_by(sex) %>% 
    summarise(mean_age = mean(age),
              sd_age = sd(age))

sinai_covid %>% 
    group_by(facility) %>% 
    summarise(median_age = median(age),
              mean_bmi = mean(bmi))

sinai_covid %>% 
    group_by(facility, sex) %>% 
    summarise(mean_age = mean(age),
              sd_age = sd(age))

sinai_covid %>% 
    group_by(smoking_status, sex) %>% 
    summarise(mean_sbp = mean(systolic_bp),
              median_sbp = median(systolic_bp),
              sd_sbp = sd(systolic_bp))

sinai_covid %>% 
    count(smoking_status)

sinai_covid %>% 
    count(smoking_status, name = "n_patients")

sinai_covid %>% 
    count(chronic_kidney_disease, name = "n_patients")

sinai_covid %>% 
    group_by(facility) %>% 
    count(smoking_status, diabetes, name = "total_patients")


sinai_covid %>% 
    group_by(facility) %>% 
    filter(diabetes == 1) %>% 
    count(smoking_status, diabetes)

smoking <- c("YES", "NEVER")
smoking

tibble1 <- sinai_covid %>% 
    filter(smoking_status %in% c("YES", "NEVER")) %>% 
    count(smoking_status, name = "total")
tibble1

tibble2 <- sinai_covid %>% 
    filter(smoking_status %in% c("YES", "QUIT")) %>% 
    group_by(smoking_status) %>% 
    summarise(n_diabetes = sum(diabetes),
              n_obesity = sum(obesity))
tibble2


left_join(tibble1, tibble2)

right_join(tibble1, tibble2)

inner_join(tibble1, tibble2)

full_join(tibble1, tibble2)


tibble1 <- sinai_covid %>% 
    count(ethnicity, name = "total")
tibble1

tibble2 <- sinai_covid %>% 
    group_by(ethnicity) %>% 
    summarise(mean_sbp = mean(systolic_bp),
              mean_dbp = mean(diastolic_bp))
tibble2

tibble3 <- full_join(tibble1, tibble2)

tibble3

