# Load the tidyverse package
library(tidyverse)

## Create a new tibble
tibble(
  x = 1:5,
  y = 1,
  z = x ^ 2 + y
)

## Printing
# data frame
df <- data.frame(
  id = 1001:2000,
  date = lubridate::today() + runif(1000) * 30,
  IQ = round(runif(1000, min = 80, max = 120), digits = 0),
  score1 = runif(1000),
  score2 = runif(1000),
  group = sample(letters, 1000, replace = TRUE)
)

# tibble
tib <- tibble(
  id = 1001:2000,
  date = lubridate::today() + runif(1000) * 30,
  IQ = round(runif(1000, min = 80, max = 120), digits = 0),
  score1 = runif(1000),
  score2 = runif(1000),
  group = sample(letters, 1000, replace = TRUE)
)

## Printing
df
tib

## Subsetting
# Extract by name
df$IQ
df$date # for extracting date
df[["IQ"]]

# Extract by position
df[[3]]

# Use the pipe to extract (you’ll need to use the special placeholder .)
tib %>% .$group
tib %>% .[["group"]]

# Data import
sinai_covid <- read_csv("Sinai_covid.csv")
View(sinai_covid)

write_csv(sinai_covid, "sinai_covid.csv")
## Tidy data
# You can represent the same underlying data in multiple ways. 
# The example below shows the number of TB cases documented by the WHO in Afghanistan, Brazil, and China 
# between 1999 and 2000, organised in four different ways. 
# Each dataset shows the same values of four variables country, year, population, and cases.
table1
table2
table3
# Spread across two tibbles
table4a  # cases
table4b  # population

## Pivoting
# Longer
table4a %>% 
  pivot_longer(c(`1999`, `2000`), 
               names_to = "year",
               values_to = "cases")
table4b %>% 
  pivot_longer(c(`1999`, `2000`), 
               names_to = "year",
               values_to = "population")

# wider
table2 %>% 
  pivot_wider(names_from = type, 
              values_from = count)

## Separating

## Case study
who


# gather together all the columns from new_sp_m014 to newrel_f65

# replace the characters “newrel” with “new_rel”.
who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

# separate the values in each code by spliting the codes at each underscore.

# separate sexage into sex and age by splitting after the first character

# full code to tidy the who dataset
who_clean <- who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE) %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel")) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)

# Column names - Automatic cleaning
library(janitor)

# Manual name cleaning

## Use select()

# move sex to beginning

# Remove columns

# Column creation and transformation

# Integrate steps with the pipe 

# Write the clean dataset into a file
