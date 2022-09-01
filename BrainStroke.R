
## File setup

rm(list=ls()) # Remove all variables previously stored
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, # Load libraries
               lubridate, plotly, rio, rmarkdown, shiny, stringr, tidyr,
               psych)
library(datasets)

## Import data set

BrainStroke <- read.csv("Z:/Programming/R/BrainStroke/BrainStroke.csv")
head(BrainStroke)

## Age and Gender distribution

ggplot(BrainStroke, aes(x=age, fill=gender)) +
  labs(title = "Age distribution in Dataset | Stacked") +
  geom_histogram(bins=30)

hist(BrainStroke$age [BrainStroke$gender == 'Male'],
     main = 'Male by age',
     ylab = 'count',
     xlab = 'Age',
     col = 'red',
     breaks = 30
     )

hist(BrainStroke$age [BrainStroke$gender == 'Female'],
     main = 'Female by age',
     ylab = 'count',
     xlab = 'Age',
     col = 'blue',
     breaks = 30
     )

## Age vs Strokes

ggplot(BrainStroke, aes(x=age, fill=stroke==1)) +
  labs(title = "Age vs Stroke strokes | Stacked") +
  geom_histogram(bins=30)

hist(BrainStroke$age [BrainStroke$stroke == 1 & BrainStroke$gender == 'Male'],
     main = 'Male',
     ylab = 'count',
     xlab = 'Age',
     col = 'red',
     breaks = 30
     )

hist(BrainStroke$age [BrainStroke$stroke == 1 & BrainStroke$gender == 'Female'],
     main = 'Female',
     ylab = 'count',
     xlab = 'Age',
     col = 'blue',
     breaks = 30
     )

## BMI vs Stroke

hist(BrainStroke$bmi [BrainStroke$stroke == 1 & BrainStroke$gender == 'Male'],
     main = 'Male',
     ylab = 'count',
     xlab = 'BMI',
     col = 'red',
     breaks = 30
     )
hist(BrainStroke$bmi [BrainStroke$stroke == 1 & BrainStroke$gender == 'Female'],
     main = 'Female',
     ylab = 'count',
     xlab = 'BMI',
     col = 'blue',
     breaks = 30
     )

## BMI vs Avg Glucose Level

library(ggExtra)

ggMarginal(ggplot(data = BrainStroke, mapping = aes(x = bmi, y = avg_glucose_level)) +
    geom_point(aes(color = gender)), type = "histogram", fill="pink")

## Age vs BMI

ggplot(BrainStroke, aes(x=age, y=bmi)) + 
  geom_point(aes(col=bmi, size=age)) + 
  geom_smooth(method="loess", se=F) + 
  labs(subtitle="Age Vs BMI", 
       y="BMI", 
       x="Age", 
       title="Scatterplot", 
       )

## Gender vs BMI

ggplot(BrainStroke, aes(x=bmi, fill=gender)) +
  labs(title = "Age vs BMI | Stacked") +
  geom_histogram(bins=30)

hist(BrainStroke$bmi [BrainStroke$gender == 'Male'],
     main = 'Male',
     ylab = 'Count',
     xlab = 'BMI',
     col = 'red',
     breaks = 30
     )

hist(BrainStroke$bmi [BrainStroke$gender == 'Female'],
     main = 'Female',
     ylab = 'Count',
     xlab = 'BMI',
     col = 'blue',
     breaks = 30
     )

## Glucose Level vs Stroke

hist(BrainStroke$avg_glucose_level [BrainStroke$stroke == 1 & BrainStroke$gender == 'Male'],
     main = 'Male',
     ylab = 'count',
     xlab = 'BMI',
     col = 'red',
     breaks = 30
     )

hist(BrainStroke$avg_glucose_level [BrainStroke$stroke == 1 & BrainStroke$gender == 'Female'],
     main = 'Female',
     ylab = 'count',
     xlab = 'BMI',
     col = 'blue',
     breaks = 30
     )

## BMI vs Avg Glucose Level

ggMarginal(ggplot(data = BrainStroke, mapping = aes(x = bmi, y = avg_glucose_level)) +
    geom_point(aes(color = gender)), type = "histogram", fill="pink")

## Age vs BMI

ggplot(BrainStroke, aes(x=age, y=bmi)) + 
  geom_point(aes(col=bmi, size=age)) + 
  geom_smooth(method="loess", se=F) + 
  labs(subtitle="Age Vs BMI", 
       y="BMI", 
       x="Age", 
       title="Scatterplot", 
       )

## Gender vs BMI

ggplot(BrainStroke, aes(x=bmi, fill=gender)) +
  labs(title = "Age vs BMI | Stacked") +
  geom_histogram(bins=30)

hist(BrainStroke$bmi [BrainStroke$gender == 'Male'],
     main = 'Male',
     ylab = 'Count',
     xlab = 'BMI',
     col = 'red',
     breaks = 30
     )

hist(BrainStroke$bmi [BrainStroke$gender == 'Female'],
     main = 'Female',
     ylab = 'Count',
     xlab = 'BMI',
     col = 'blue',
     breaks = 30
     )
