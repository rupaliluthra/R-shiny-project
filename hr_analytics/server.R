server <- function(input, output) {
  output$count <- renderPlot({
    employee %>% group_by (., Attrition) %>% 
      summarise(., count = n()) %>% 
      ggplot(.,aes(x=Attrition,y=count )) +
      geom_bar(aes(fill = Attrition),stat ="identity")
  })
  
  output$percent <- renderPlot({
    employee %>% group_by(., Attrition) %>% 
      summarise(., Percentage = n()/nrow(employee)) %>% 
      ggplot(.,aes(x=Attrition,y=Percentage )) +
      geom_bar(aes(fill=Attrition),stat="identity")
  })
  
  output$who_plot <- renderPlot({
    if (input$who_category == 'Gender'){
      who_leaving %>%
        group_by(Gender) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = Gender, y = count)) + 
        geom_bar(stat = "identity") +
        coord_flip()
    }
    else if (input$who_category == 'Department'){
      who_leaving %>%
        group_by(Department) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = Department, y = count)) + 
        geom_bar(stat = "identity") +
        coord_flip()
    }
    else if (input$who_category == 'JobRole'){
      who_leaving %>%
        group_by(JobRole) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = JobRole, y = count)) + 
        geom_bar(stat = "identity") +
        coord_flip()
    }
    else if (input$who_category == 'Age'){
      who_leaving %>%
        group_by(Age) %>% 
        summarise(count = n()) %>% 
        ggplot(., aes(x = Age, y = count)) + 
        geom_bar(stat = "identity") +
        coord_flip()
    }
    
  }
  )
}
  
  
  

