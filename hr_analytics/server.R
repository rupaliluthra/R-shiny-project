server <- function(input, output) {
  output$count <- renderPlot(
    employee %>% group_by (., Attrition) %>% 
      summarise(., count=n()) %>% 
      ggplot(.,aes(x=Attrition,y=count )) +
      geom_bar(aes(fill = Attrition),stat="identity"),
    
  
  output$percent <- renderPlot(
    employee %>% group_by (., Attrition) %>% 
      summarise(., Percentage = n()/nrow(employee)) %>% 
      ggplot(.,aes(x=Attrition,y=Percentage )) +
      geom_bar(aes(fill=Attrition),stat="identity")
    
    
    
    )
}
  
  
  
}
