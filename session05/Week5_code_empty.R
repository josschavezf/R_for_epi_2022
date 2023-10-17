# Load packages
library(tidyverse)
library(janitor)
library(stringr)

# Data import
sinai_covid <- read_csv("sinai_covid.csv")
glimpse(sinai_covid)

### Working with variables ###
# Column names - Automatic cleaning
sinai_covid2 <- sinai_covid %>% 
  clean_names()
glimpse(sinai_covid2)

names(sinai_covid2)

# Manual name cleaning
names(sinai_covid)

sinai_covid3 <- sinai_covid %>% 
  rename(ckd = CHRONIC_KIDNEY_DISEASE,
         DI = DECEASED_INDICATOR)

names(sinai_covid3)

## Subset variables with select
# Select variables by name:

sinai_covid4 <- sinai_covid2 %>% 
  select(age, id, sex, race)

sinai_covid2 %>% 
  select(starts_with("d"))

sinai_covid2 %>% 
  select(starts_with("s"))

sinai_covid2 %>% 
  select(starts_with("d") & ends_with("s"))

sinai_covid2 %>% 
  select(starts_with("d") | ends_with("s"))

sinai_covid2 %>% 
  select(contains("deceased"))

# Select and rename
sinai_covid2 %>% 
  select(folio = id)

# Select variables by position:
names(sinai_covid2)
sinai_covid2 %>% 
  select(1,3,17,21:24)

# Use the : operator to select a range of consecutive variables
sinai_covid2 %>% 
  select(systolic_bp:bmi)

# move sex to beginning
sinai_covid2 %>% 
  select(sex, age, id, race)

# Remove columns
sinai_covid5 <- sinai_covid2 %>% 
  select(-race, -sex)

## Creating variables with mutate
# Column creation and transformation
sinai_covid6 <- sinai_covid2 %>% 
  mutate(bmi10 = bmi*10)

sinai_covid6 <- sinai_covid2 %>% 
  mutate(var1 = bmi/age)

sinai_covid6 <- sinai_covid2 %>% 
  mutate(bmi10 = bmi*10,
         var1 = bmi/age)

### Working with observations ###
## Subset observations with filter()
# subset observations based on 3 criteria
sinai_covid2 %>% 
  filter(bmi > 30,
         age <= 60, 
         sex == "FEMALE") 

# subset observations by the values of one or more variables:
names(sinai_covid2)

sinai_covid2 %>% 
  filter(smoking_status %in% c("QUIT", "NEVER")) %>% 
  View()

sinai_covid2 %>% 
  filter(between(age, 15, 60))

#Reordering observations with arrange


# Integrate steps with the pipe 

covid_clean <- sinai_covid %>%
  clean_names() %>% 
  rename(department = department_name) %>% 
  select(id:race, bmi, 11, 15:18 ) %>% 
  mutate(new_var = systolic_bp/diastolic_bp) %>% 
  filter(sex == "MALE", smoking_status == "YES")

# # Write the clean dataset into a file
write_csv(covid_clean, "covid_clean.csv")

############################

## Case study
glimpse(who1)

who1 <- who %>% # gather together all the columns from new_sp_m014 to newrel_f65
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE)

who2 <- who1 %>% 
  mutate(key = str_replace(key, "newrel", "new_rel")) # replace the characters “newrel” with “new_rel”. 

who3 <- who2 %>% 
  separate(key, c("new", "type", "sexage"), sep = "_") # separate the values in each code by spliting the codes at each underscore.

who4 <- who3 %>% 
  separate(sexage, c("sex", "age"), sep = 1) # separate sexage into sex and age by splitting after the first character

# full code to tidy the who dataset
who_clean <- who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE) %>% 
  mutate(key = str_replace(key, "newrel", "new_rel")) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  separate(sexage, c("sex", "age"), sep = 1) %>%
  select(-new, -iso2, -iso3)



