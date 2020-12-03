#Advent of Code 2020
#rm(list=ls())

setwd("C:/Users/50670/Documents/Personal/Advent of Code 2020")

library(tidyverse)
library(dplyr)
library(sjmisc)
library(stringr)

## DAY 2 --Part 1 ##
data2 <- read_csv(here::here("data_day2.csv"))  

#Make two columns first
data3 <- data2 %>%
  separate(HEADER, c("rule","password"), sep=":")


data4 <- data3 %>%
  separate(rule, c("rule_num","rule_letter"), sep=" ")  %>%     #Extract the rule letter from rule numbers
  separate(rule_num, c("rule_min","rule_max"), sep="-")         #Extract min and max

data4$rule_letter <- substr(data4$rule_letter,1,1)              #Make sure this is length 1 for comparison later

#Use str_count to get the number of times the rule letter appears in rule_password
data4$numberofletter <- str_count(data4$password, data4$rule_letter)


#this is janky nut the incbounds wouldn't work (still the wrong answer though)
data4$test <- between(data4$numberofletter, (as.numeric(data4$rule_min)-1), (as.numeric(data4$rule_max)+1))  

#This part doesn't work, incbounds does work
data4$test <- between(data4$numberofletter, (as.numeric(data4$rule_min)), (as.numeric(data4$rule_max)), incbounds=YES)  

#Answer comes out here
sum(data4$test)
