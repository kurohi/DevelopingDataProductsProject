library(shiny)

db = read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=100000)
db$Datetime = strptime(paste(db$Date,db$Time), "%d/%m/%Y %H:%M:%S")

dataset = db

shinyServer(function(input, output) {
  #sample size and by date range
  dataset = reactive(function() {
    startDatetime = strptime(paste("01",input$startMonth,input$startYear), "%d %m %Y")
    endDatetime = strptime(paste("01",input$endMonth,input$endYear), "%d %m %Y")
    subset(db[0:input$sampleSize,], (Datetime>=startDatetime)&(Datetime<endDatetime))
  })
  
  
  #download the Dataset
  output$downloadData = downloadHandler(
    filename = function() { paste(input$dataset, '.csv', sep='') },
    content = function(file) {
      write.csv(dataset(), file)
    }
  )
  
  output$mytable = renderDataTable({db}, options = list(bSortClasses = TRUE))
  
  output$plot = reactivePlot(function() {
    workdata = dataset()
    with(workdata, plot(Datetime, Global_active_power, ylab="Global Active Power (kilowatts)", 
                       xlab="", type="n"))
    with(workdata, lines(Datetime, Global_active_power))
  }, height=700)
  
})