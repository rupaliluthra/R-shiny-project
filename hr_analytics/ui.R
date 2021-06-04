

shinyUI <- dashboardPage(
  dashboardHeader(title = "Turnover Analysis"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "intro"),
      menuItem("How many are leaving", tabName = "how_many" ),
      menuItem("Who is leaving", tabName = "who" ),
      menuItem("Why people Quit", tabName = "why"),
      menuItem("Conclusion", tabName = "conclusion"))
    
  ))

  
  dashboardBody(
    tabItems(
    tabItem(tabName = "how_many",
            fluidRow(column(5, plotOutput("count")),
                     column(7, plotOutput("percent")) ))))
    
            

