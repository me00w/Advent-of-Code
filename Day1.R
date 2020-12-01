#Advent of Code 2020
#rm(list=ls())
library(tidyverse)


## DAY 1 --Part 1 ##
data1 <- read_csv(here::here("data_day1.csv"))  

expense_vector1 <- as.vector(data1$expense)       #Make vectors
expense_vector2 <- as.vector(data1$expense)  


#Double loop, 1 for first vector and another for second vector, starting where you were in first vector
#Output numbers, as well as product
  for (i in 1:200){
    for(j in i:length(expense_vector1)){
      sum=expense_vector1[i]+expense_vector2[j]
      if (sum==2020){
        print (paste0("Numbers are: ",expense_vector1[i], " , ",expense_vector1[j]))
        multiply<-expense_vector1[i]*expense_vector2[j]
        print(paste0("the answer is: ",multiply))
      }
    } 
  }
  

## DAY 1 --Part 2 ##
#Add another loop to the example above, start each where you were in the previous vector, so j starts with i and k starts with j

expense_vector3 <- as.vector(data1$expense)     #Make one more vector

for (i in 1:200){
  for(j in i:length(expense_vector1)){
    for(k in j:length(expense_vector1)){
    sum=expense_vector1[i]+expense_vector2[j]+expense_vector3[k]
    if (sum==2020){
      print (paste0("Numbers are: ",expense_vector1[i], " , ",expense_vector1[j], " , ",expense_vector1[k]))
      multiply<-expense_vector1[i]*expense_vector2[j]*expense_vector2[k]
      print(paste0("the answer is: ",multiply))
      }
    } 
  }
}
