
library(shiny)
library(leaflet)
library(ggplot2)
library(fiftystater)
library(readr)
library(curl)
library(mapproj)
data <- read.csv(curl("https://chronicdata.cdc.gov/api/views/4ny5-qn3w/rows.csv?accessType=DOWNLOAD"))
#data <- fread('https://chronicdata.cdc.gov/api/views/4ny5-qn3w/rows.csv?accessType=DOWNLOAD')

#data <- read.csv(url('https://chronicdata.cdc.gov/api/views/4ny5-qn3w/rows.csv?accessType=DOWNLOAD'))

server<-function(input, output){
    #Modify the dataset
    newData<-data[!(data$Data_Value_TypeID=="Crude" | data$BreakoutCategoryID=="BOC04") | data$LocationAbbr=="USM", ]
    newData$conditionID[newData$IndicatorID=="BR003"]<-"Heart attack"
    newData$conditionID[newData$IndicatorID=="BR021"]<-"Healthy weight"
    newData$conditionID[newData$IndicatorID=="BR011"]<-"Hypertension"
    newData$conditionID[newData$IndicatorID=="BR019"]<-"Obesity"
    newData$conditionID[newData$IndicatorID=="BR005"]<-"Stroke"
    newData$conditionID[newData$IndicatorID=="BR001"]<-"Cardiovascular disease"
    newData$conditionID[newData$IndicatorID=="BR016"]<-"Diabetes"
    newData$conditionID[newData$IndicatorID=="BR017"]<-"Smoking"
    newData$LocationDesc<-sapply(newData$LocationDesc, tolower)
    
    #Load US map data
    data("fifty_states")
    subData = reactive({newData[which(newData$Break_out == input$gender & newData$Year == input$year & newData$conditionID == input$prevalence),]
      })
    
    output$plot1 <- renderPlot({
      ## Render a US map plot
      ggplot(data=subData(), aes(map_id = LocationDesc)) + 
        # map points to the fifty_states shape data
        geom_map(aes(fill = Data_Value), map = fifty_states) + 
        expand_limits(x = fifty_states$long, y = fifty_states$lat) +
        scale_x_continuous(breaks = NULL) + 
        scale_y_continuous(breaks = NULL) +
        coord_map() +
        labs(x = "", y = "") +
        theme(legend.position = "bottom", panel.background = element_blank()) +
        labs(fill="Prevalence (%)") + 
        scale_fill_continuous(high = "#132B43", low = "#56B1F7")
    })
    
    output$text<-renderText({
      paste("Prevalence of ", input$prevalence, "in US adults (", input$gender, "), ", input$year)
    })
    
  }
  

 

