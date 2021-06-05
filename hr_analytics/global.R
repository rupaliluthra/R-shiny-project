library(tidyverse)
library(shinydashboard)
library(shiny)

employee = read.csv("HR_employee_attrition.csv", stringsAsFactors = F)
names(employee)[1] = 'Age'
who_leaving = employee %>% select(.,Gender, Age, JobLevel, JobRole, Department, Attrition) %>% filter(., Attrition == 'Yes')
