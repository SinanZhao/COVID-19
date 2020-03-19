library("dplyr")
library("remotes")
library("leaflet")
library("ggplot2")
library("plotly")
library("knitr")


# Load data
Excel_trend <- read.csv("./data/Excel_trend.csv",
                     header = TRUE,
                     stringsAsFactors = FALSE) 
Zoom_trend <- read.csv("./data/Zoom_trend.csv",
                        header = TRUE,
                        stringsAsFactors = FALSE) 
Telecommuting_trend <- read.csv("./data/Telecommuting_trend.csv",
                        header = TRUE,
                        stringsAsFactors = FALSE) 


# Plot of Excel
plot_Excel <- ggplot()+geom_line(data = Excel_trend,aes(x = as.Date(date),y = confirmed,colour = "Confirmed Case"),size=0.6)+
  geom_line(data = Excel_trend,aes(x = as.Date(date),y = search_intensity,colour = "Excel"),size=0.6) +
  geom_point(data = Excel_trend,aes(x = as.Date(date),y = search_intensity,colour = "Excel"),size= 0.7) +
  geom_point(data = Excel_trend,aes(x = as.Date(date),y = confirmed,colour = "Confirmed Case"),size=0.7) +
  ylab("Frequency")+ xlab("Date") +
  theme(text=element_text(size= 9)) #+
  #ggtitle("Search Intensity of Excel")

plotly_Excel <- ggplotly(plot_Excel)

# Plot of Zoom
plot_Zoom <- ggplot()+geom_line(data = Zoom_trend,aes(x = as.Date(date),y = confirmed,colour = "Confirmed Case"),size= 0.6)+
  geom_line(data = Zoom_trend,aes(x = as.Date(date),y = search_intensity,colour = "Zoom"),size= 0.6) + 
  geom_point(data = Zoom_trend,aes(x = as.Date(date),y = search_intensity,colour = "Zoom"),size= 0.7) +
  geom_point(data = Zoom_trend,aes(x = as.Date(date),y = confirmed,colour = "Confirmed Case"),size=0.7) +
  ylab("Frequency")+ xlab("Date") +
  theme(text=element_text(size=9)) #+
  #ggtitle("Search Intensity of Zoom")

plotly_Zoom <- ggplotly(plot_Zoom)

# Plot of telecommuting
plot_Telecommuting <- ggplot()+geom_line(data = Telecommuting_trend,aes(x = as.Date(date),y = confirmed,colour = "Confirmed Case"),size= 0.6)+
  geom_line(data = Telecommuting_trend,aes(x = as.Date(date),y = search_intensity,colour = "Telecommuting"),size= 0.6) + 
  geom_point(data = Telecommuting_trend,aes(x = as.Date(date),y = search_intensity,colour = "Telecommuting"),size= 0.7) +
  geom_point(data = Telecommuting_trend,aes(x = as.Date(date),y = confirmed,colour = "Confirmed Case"),size=0.7) +
  ylab("Frequency")+ xlab("Date") +
  theme(text=element_text(size=9)) #+
  #ggtitle("Search Intensity of Telecommuting")

plotly_Telecommuting <- ggplotly(plot_Telecommuting)
