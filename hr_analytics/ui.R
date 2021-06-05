dashboardPage(
  dashboardHeader(title = "Turnover Analysis"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "intro"),
      menuItem("How many are leaving", tabName = "how_many" ),
      menuItem("Who is leaving", tabName = "who" ),
      menuItem("Why people Quit", tabName = "why"),
      menuItem("Conclusion", tabName = "conclusion"))
    
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "intro",
              fluidPage(
                fluidRow(
                  column(offset = 2, width = 8, 
                         h1(tags$b("Employee Attritions"))
                  )
                ),
                br(),
                fluidRow(
                  img(src = "http://thecontextofthings.com/wp-content/uploads/2017/01/employee-attrition.jpg", height = 200)
                )
              )     
      ),
      tabItem(tabName = "how_many",
              fluidPage(
                fluidRow(
                  column(offset = 2, width = 8, 
                         h1(tags$b("Attrition by count and Percentage"))
                  )
                ),
                br(),
                fluidRow(
                  column(5, plotOutput("count")),
                  column(7, plotOutput("percent"))
                )
              )
      ),
      tabItem(tabName = "who",
              fluidPage(
                selectizeInput(inputId = 'who_category', label = 'Who Category',
                               choices = names(who_leaving[1:5])),
                br(),
                plotOutput("who_plot")
              )
              
      )  
    )
  )
)

