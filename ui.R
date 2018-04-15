#
#The application must include the following:
#
#Some form of input (widget: textbox, radio button, checkbox, ...)
#Some operation on the ui input in sever.R
#Some reactive output displayed as a result of server calculations
#You must also include enough documentation so that a novice user 
#could use your application.
#The documentation should be at the Shiny website itself.


library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    headerPanel("500 cities project: behavioural risk factors for heart disease"),
    sidebarPanel(

      selectInput('year', 'Year', choices = c("2011","2012","2013","2014","2015"), selected = "2011"),
      selectInput('gender', 'Gender', choices = c("Female", "Male", "Overall")),
      selectInput('prevalence', 'Prevalence among US adults', choices = c("Heart attack", "Cardiovascular disease", "Diabetes", "Smoking", "Healthy weight", "Hypertension", "Obesity", "Stroke")),
      p("Please be patient as the data loads, courtesy of the US Centers for Disease Control and Prevention 500 Cities Project.")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3(textOutput("text"), align="center")
    )
  ))
