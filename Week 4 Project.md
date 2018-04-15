Developing Data Products
Week 4 Project
========================================================
author: Naomi
date: 15 April 2018
autosize: true

Assignment
========================================================

This presentation is for Coursera's Week 4 peer reviewed assignment to: 
- Create a Shiny application
- Pitch the application via Slidify or Rstudio Presenter

About the Data
========================================================
This application was created using data from the US Centers for Disease Control and Prevention (CDC). The CDC data can be accessed [here](https://chronicdata.cdc.gov/Heart-Disease-Stroke-Prevention/Behavioral-Risk-Factor-Data-Heart-Disease-Stroke-P/4ny5-qn3w). It is behavioural risk factor data for heart disease and stroke prevention in US adults, from 2011 to present. 
- The data comes from a state-based surveillance system that collects information about modifiable risk factors for chronic diseases and other leading causes of death (BRFSS). 
- The system is designed to integrate multiple indicators from many data sources to provide a comprehensive picture of the public health burden of CVDs and associated risk factors in the United States. 

About the Application
========================================================
The Shiny application allows a user to filter the prevalence data and map it to all 50 US states. The dataset has 85,800 observations. The input filters are:
- Year
- Gender
- Risk factor (e.g. smoking, heart attack, obesity)

The application can be accessed at: 
- Shiny link:[https://ndee2018.shinyapps.io/Week4Project/]
- Github link:[https://github.com/NomiDee/DevelopingDataProductsWeek4]

Behavioural Risk Factors Dataset
========================================================


```r
library(readr)
library(curl)
data <- read.csv(curl("https://chronicdata.cdc.gov/api/views/4ny5-qn3w/rows.csv?accessType=DOWNLOAD"))
names(data)
```

```
 [1] "Year"                       "LocationAbbr"              
 [3] "LocationDesc"               "Datasource"                
 [5] "PriorityArea1"              "PriorityArea2"             
 [7] "PriorityArea3"              "PriorityArea4"             
 [9] "Category"                   "Topic"                     
[11] "Indicator"                  "Data_Value_Type"           
[13] "Data_Value_Unit"            "Data_Value"                
[15] "Data_Value_Alt"             "Data_Value_Footnote_Symbol"
[17] "Data_Value_Footnote"        "Confidence_Limit_Low"      
[19] "Confidence_Limit_High"      "Break_Out_Category"        
[21] "Break_out"                  "CategoryID"                
[23] "TopicID"                    "IndicatorID"               
[25] "Data_Value_TypeID"          "BreakoutCategoryID"        
[27] "BreakOutID"                 "LocationID"                
[29] "GeoLocation"               
```

