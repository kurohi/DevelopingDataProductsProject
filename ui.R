library(shiny)

db = read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=100000)
db$Datetime = strptime(paste(db$Date,db$Time), "%d/%m/%Y %H:%M:%S")

dataset = db

shinyUI(fluidPage(
  navbarPage("Coursera's Developing Data Products Course"),
  titlePanel("Gloabal Active Power Consuption"),
  sidebarLayout(
    sidebarPanel(
      
      h3('Tweek the Plot'),
      
      sliderInput('sampleSize', 'Choose Sample Size', min=1, max=nrow(dataset),
                  value=min(500, nrow(dataset)), step=1000, round=0),
      

      selectInput('startYear', 'Start Year', as.list(c(2006, 2007,2008))),
      selectInput('startMonth', 'Start Month', as.list(c(1:12))),
      
      selectInput('endYear', 'End Year',as.list(c(2006, 2007, 2008)), selected=2008),
      selectInput('endMonth', 'End Month', as.list(c(1:12)), selected=12),
      
      downloadButton('downloadData', 'Download Train set'),
      tags$br(),
      tags$br(),
      strong('NOTES'),
      p('Since the data is sorted by time, it is needed to increase the sample size to access older points of data')
      
      ),
    
    mainPanel(
      h2('Basic Introductory Exploratory Analysis'),
      p('Note that this exploratory analisys tool is very basic and more directed to exemplify the shiny usability than for being actually useful'),
      p('It uses a househould energy consuption data from Coursera exploratory data analysis course'),

      h4('Getting Started with this Web App'),
      p('On the right panel you can select the time spam or the amount of samples.'),
      p('since the data is sorted by date, choosing the time spam have the same effect as choosing the sample size.'),
      p('However, please note that the samplesize have the priority and you cant choose a time spam that was not sampled.'),

      plotOutput('plot'),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br(),
      tags$br()

      
    )
  )
))