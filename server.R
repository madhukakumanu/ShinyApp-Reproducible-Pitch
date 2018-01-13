#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)


state = c("Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu Kashmir","Karnataka","Kerala","Madhya Pradesh","Maharashtra"
          ,"Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Punjab","Rajasthan","Sikkim","Tamil Nadu","Tripura","Uttar Pradesh","West Bengal","Chhattisgarh","Uttarakhand"
          ,"Jharkhand","Telangana","Delhi","Andaman  Nicobar Islands","Chandigarh","Dadra  Nagar Haveli","Daman  Diu","Lakshadweep","Puducherry")

capitalcity = c("Hyderabad","Itanagar","Dispur","Patna","Panaji","Gandhinagar","Chandigarh","Shimla","Srinagar","Bangalooru","Thiruvananthapuram","Bhopal","Mumbai","Imphal"
                ,"Shillong","Aizawl","Kohima","Bhubaneswar","Chandigarh","Jaipur","Gangtok","Chennai","Agartala","Lucknow","Kolkata","Raipur","Dehradun","Ranchi","Amaravati"
                ,"New Delhi","Port Blair","Chandigarh","Silvasa","Daman","Kavaratti","Puducherry")

latitude = c(17.38504,27.08437,26.14335,25.5941,15.49093,23.21564,30.73332,31.10481,34.08367,13.02844,8.524139,23.25993,19.07598,24.81701,25.57877,23.72711,25.6586,20.29606,30.73332,26.91243,27.33894,
             13.08268,23.83146,26.84669,22.57265,21.25138,30.3165,23.3441,16.57298,28.61394,11.62338,30.73332,20.27627,20.39737,10.55932,13.801)

longitude = c(78.48667,93.60532,91.7898,85.13757,73.82785,72.63694,76.77942,77.1734,74.79728,77.54618,76.93664,77.41262,72.87766,93.93684,91.89325,92.71764,94.10533,85.82454,76.77942,75.78727,88.6065,
              80.27072,91.28678,80.94617,88.3639,81.62964,78.03219,85.30956,80.35751,77.20902,92.72648,76.77942,73.00831,72.8328,72.63581,78.92553)

capitalcities <- data.frame(state,capitalcity,latitude,longitude)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  statedata <- reactive({
    
     subset(capitalcities, state == input$State, select = c(capitalcity,latitude,longitude))
    
    
  })
  
  output$secondSelection <- renderUI({
    selectInput("CapitalCity", "Capital City Of State Selected ", choices = statedata()$capitalcity, selected = "Hyderabad")
  })
   
  output$mymap <- renderLeaflet({
    
    leaflet() %>% 
    
      addTiles() %>%
      setView(lng = statedata()$longitude,lat=statedata()$latitude, zoom=15) %>%
      addMarkers(lng=statedata()$longitude,lat=statedata()$latitude,popup=statedata()$capitalcity)
    
  })
  
})
