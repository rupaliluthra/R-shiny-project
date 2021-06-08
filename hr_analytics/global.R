library(tidyverse)
library(shinydashboard)
library(shiny)

employee = read.csv("HR_employee_attrition.csv", stringsAsFactors = F)
names(employee)[1] = 'Age'
employee$Age = cut(employee$Age, breaks = c(17,26,34,43,51,60),
                   labels = c("18-26","27-34","35-43","44-51","52-60"))

who_leaving = employee %>% select(.,Gender, Age, JobLevel, JobRole, Department, Attrition) %>% filter(., Attrition == 'Yes')

att_vs_jobsat = employee  %>% group_by(Attrition) %>% summarize(Mean = round(mean(JobSatisfaction), 2))
