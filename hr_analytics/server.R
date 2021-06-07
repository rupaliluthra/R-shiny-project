server <- function(input, output) {
  output$count <- renderPlot({
    employee %>% group_by (., Attrition) %>% 
      summarise(., count = n()) %>% 
      ggplot(.,aes(x=Attrition,y=count )) +
      theme_bw() +
      geom_bar(aes(fill = Attrition),stat ="identity")
   
  })
  
  output$percent <- renderPlot({
    employee %>% group_by(., Attrition) %>% 
      summarise(., Percentage = n()/nrow(employee)) %>% 
      ggplot(.,aes(x=Attrition,y=Percentage )) +
      theme_bw() +
      geom_bar(aes(fill=Attrition),stat="identity")
  })
  
  output$job_satisfaction <- renderPlot({
    ggplot(att_vs_jobsat,aes(x= Attrition, y = Mean,color= Attrition,
                             fill= Attrition)) +
      scale_fill_brewer(palette="Set2") +
      geom_bar(stat = "identity") + 
      ggtitle("Attrition and Job Satisfaction") +
      theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15))+
      theme_bw() +
      labs(x = "Attrition", y = " Avg Job Satisfaction") +
      coord_flip()
  })
  
  output$dist_from_work <- renderPlot({
    ggplot(employee, aes(x=DistanceFromHome, fill=Attrition, 
                         color=Attrition)) +
      geom_density(position="identity", alpha=0.5) +
      theme_bw() + 
      scale_fill_brewer(palette="Set2") +
      ggtitle("Attrition and Distance from work") + 
      theme(plot.title = element_text(face = "bold", hjust = 0.4, size = 15)    ) +
      labs(x = "Distance from Work")
  })
  
  output$business_travel <- renderPlot({
    employee %>%
      group_by(BusinessTravel) %>%
      tally() %>%
      ggplot(aes(x = BusinessTravel, y = n,fill=BusinessTravel)) +
      geom_bar(stat = "identity") +
      scale_fill_brewer(palette="Set2") +
      theme_bw()+
      labs(x="Business Travel", y="Number Attriation")+
      ggtitle("Attrition and Business Travel")+
      theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15))
  })
  
  output$monthly_income <- renderPlot({
    ggplot(employee,aes(x= Attrition, y= MonthlyIncome,fill= Attrition)) +
      theme_bw()+
      geom_boxplot(alpha=0.3)+
      ggtitle("Attrition and MonthlyIncome")+
      #theme(plot.title = element_text(hjust = 0.5))+
      theme(plot.title = element_text(face = "bold", hjust = 0.4, size = 15))+
      geom_boxplot()
    
  }) 
  
  output$who_plot <- renderPlot({
    if (input$who_category == 'Gender'){
      who_leaving %>%
        group_by(Gender) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = Gender, y = count)) +
        theme_bw()+
        geom_bar(aes(fill = Gender),stat = "identity") +
        coord_flip()
    }
    else if (input$who_category == 'Department'){
      who_leaving %>%
        group_by(Department) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = reorder(Department,count), y = count)) + 
        geom_bar(aes(fill = Department),stat = "identity") +
        theme_bw()+
        coord_flip()
    }
    else if (input$who_category == 'JobRole'){
      who_leaving %>%
        group_by(JobRole) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = reorder(JobRole,count), y = count)) + 
        geom_bar(aes(fill= JobRole),stat = "identity") +
        theme_bw()+
        coord_flip()
    }
    else if (input$who_category == 'Age'){
      who_leaving %>%
        group_by(Age) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = reorder(Age,count), y = count)) + 
        geom_bar(aes(fill = Age),stat = "identity") +
        theme_bw()+
        coord_flip()
    }
    else if (input$who_category == 'JobLevel'){
      who_leaving %>%
        group_by(JobLevel) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = reorder(JobLevel,count), y = count)) + 
        geom_bar(aes(fill = JobLevel),stat = "identity") +
        theme_bw()+
        coord_flip()
    }
  
  
    
  }
  )
}
  
  
  

