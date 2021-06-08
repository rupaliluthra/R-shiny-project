dashboardPage(
  dashboardHeader(title = "Attrition Analysis"),
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
                  column(offset = 3, width = 8, 
                         h1(tags$b("Employee Attritions"))
                  )
                ),
                br(),
                fluidRow(
                  column(offset = 1, width = 10, align = "center",
                  img(src = "http://thecontextofthings.com/wp-content/uploads/2017/01/employee-attrition.jpg", height = 300)
                )),
                br(),
                fluidRow(
                  column(offset = 1, width = 10, align = "center", 
                        # box(width = 16, background = "yellow", 
                             p("There are very few people who begin and end their careers in one company.
                             Most people move on after a time, or the company forces them to move on
                             with an involuntary termination. People leaving organizations seems like
                             a quite straightforward matter, but there is a lot to unpack with employee attrition.
                             according to the Work Institute, each employee departure costs a company about one-third of that
                             worker's annual earnings, including expenses such as recruiter fees, temporary replacement workers
                             and lost productivity. Knowing the most likely reasons why employees leave the organization,
                             can help the organization take action and reduce the level of Attrition inside the organization."))

                        
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
                  column(6, plotOutput("count")),
                  column(6, plotOutput("percent"))
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
              
      ),
      tabItem(tabName = "why",
              fluidPage(
                fluidRow(
                  column(12, plotOutput("job_satisfaction")),
                  br(),
                  column(12, plotOutput("dist_from_work")),
                  br(),
                  column(12, plotOutput("business_travel")),
                  br(),
                  column(12, plotOutput("monthly_income"))
                  
                )
              )
              ),
      tabItem(tabName = "conclusion",
              fluidRow(
                h3(tags$b("Conclusion")),
                p("1.	The Attrition level of employees with low job satisfaction is higher"),
                p("2.	Distance from home is a key influencer to Attrition"),
                p("3.	Low income levels are a possible cause of  attrition in an organization
"),
                br(),
                br(),
                h3(tags$b("Prevention practices")),
                p("Following interventions can have positive impact on employee retention:"),
                p("Providing job-specific training and development opportunities for employees"),
                p("Offering rewards such as base pay, variable or incentive pay and benefits"),
                p("Training supervisors and managers how to lead and how to develop effective relationships with subordinates ")
              )))
      
      
  )
)

