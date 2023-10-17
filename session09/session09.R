library(tidyverse)
library(janitor)

sinai_covid <- read_csv("sinai_covid.csv")

sinai_covid <- clean_names(sinai_covid)

# facet grid
ggplot(sinai_covid, aes(x = age, y = bmi, color = sex)) +
    geom_point() +
    facet_grid(htn~sex) +
    theme_bw()

# facet wrap
ggplot(sinai_covid, aes(x = age, y = bmi)) +
    geom_point() +
    facet_wrap(~race, nrow = 4) +
    theme_bw()

# facet wrap with free scales
ggplot(sinai_covid, aes(x = age, y = bmi)) +
    geom_point() +
    facet_wrap(~race, nrow = 4, scales = "free") +
    theme_bw()

ggplot(sinai_covid, aes(x = age, y = bmi)) +
    geom_point() +
    facet_wrap(~race, nrow = 4, scales = "free_y") +
    theme_bw()

# ggarrange
library(ggpubr)

p1 <- ggplot(sinai_covid, aes(x = age, y = bmi, color = sex)) +
    geom_point() +
    facet_grid(~sex) +
    theme_bw()

p2 <- ggplot(sinai_covid, aes(x = age, y = bmi)) +
    geom_point() +
    facet_grid(~htn) +
    theme_bw()
p1
p2

ggarrange(p1, p2, labels = "AUTO")

ggarrange(p1, p2, labels = "auto")


# geom_smooth
ggplot(sinai_covid, aes(x = systolic_bp, y = diastolic_bp, color = facility)) +
    geom_point() +
    geom_smooth(se = FALSE) +
    facet_grid(~facility)

# geom_smooth
ggplot(sinai_covid, aes(x = systolic_bp, y = diastolic_bp, color = facility)) +
    geom_point() +
    geom_smooth(se = FALSE, method = "lm", fullrange = TRUE) +
    facet_grid(~facility) +
    theme_bw() +
    theme(legend.position = "none")

ggplot(sinai_covid, aes(x = diastolic_bp, y = bmi, color = factor(obesity))) +
    geom_point() +
    geom_smooth() +
    facet_grid(~obesity)


