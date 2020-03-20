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

Telecommuting_trend <- read.csv("./data/Telecommuting_trend.csv",
                                header = TRUE,
                                stringsAsFactors = FALSE) 

travel_Shanghai <- read.csv("./data/Shanghai.csv",
                            header = TRUE,
                            stringsAsFactors = FALSE)
travel_Beijing <- read.csv("./data/Beijing.csv",
                            header = TRUE,
                            stringsAsFactors = FALSE)
travel_Guangzhou <- read.csv("./data/Guangzhou.csv",
                            header = TRUE,
                            stringsAsFactors = FALSE)
travel_Naning <- read.csv("./data/Naning.csv",
                            header = TRUE,
                            stringsAsFactors = FALSE)
travel_Guiyang <- read.csv("./data/Guiyang.csv",
                            header = TRUE,
                            stringsAsFactors = FALSE)
travel_Wuxi <- read.csv("./data/Wuxi.csv",
                            header = TRUE,
                            stringsAsFactors = FALSE)
travel_Wuhan <- read.csv("./data/Wuhan.csv",
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

# plot of intracity traffic intensity in Wuhan
plot_Wuhan <- ggplot()+geom_line(data = travel_Wuhan,aes(x = as.Date(date1),y = intensity1,colour = "intensity in 2020"),size=0.6) +
  geom_point(data = travel_Wuhan,aes(x = as.Date(date1),y = intensity1,colour = "intensity in 2020"),size= 0.7) +
  geom_line(data = travel_Wuhan,aes(x = as.Date(date1),y = intensity2,colour = "intensity in 2019"),size=0.6) +
  geom_point(data = travel_Wuhan,aes(x = as.Date(date1),y = intensity2, colour = "intensity in 2019"),size= 0.7) +
  ylab("intensity")+ xlab("Date") +
  theme(text=element_text(size=9)) +
  ggtitle("Intracity Travel Intensity of Wuhan")
  
plotly_Wuhan <- ggplotly(plot_Wuhan)

# plot of intracity traffic intensity in Shanghai
plot_Shanghai <- ggplot()+geom_line(data = travel_Shanghai,aes(x = as.Date(date1),y = intensity1,colour = "intensity in 2020"),size=0.6) +
  geom_point(data = travel_Shanghai,aes(x = as.Date(date1),y = intensity1,colour = "intensity in 2020"),size= 0.7) +
  geom_line(data = travel_Shanghai,aes(x = as.Date(date1),y = intensity2,colour = "intensity in 2019"),size=0.6) +
  geom_point(data = travel_Shanghai,aes(x = as.Date(date1),y = intensity2, colour = "intensity in 2019"),size= 0.7) +
  ylab("Intensity")+ xlab("Date") +
  theme(text=element_text(size=9)) +
  ggtitle("Intracity Travel Intensity of Shanghai")

plotly_Shanghai <- ggplotly(plot_Shanghai)

# plot of intracity traffic intensity in Guiyang
plot_Naning <- ggplot()+geom_line(data = travel_Naning,aes(x = as.Date(date1),y = intensity1,colour = "intensity in 2020"),size=0.6) +
  geom_point(data = travel_Naning,aes(x = as.Date(date1),y = intensity1,colour = "intensity in 2020"),size= 0.7) +
  geom_line(data = travel_Naning,aes(x = as.Date(date1),y = intensity2,colour = "intensity in 2019"),size=0.6) +
  geom_point(data = travel_Naning,aes(x = as.Date(date1),y = intensity2, colour = "intensity in 2019"),size= 0.7) +
  ylab("Intensity")+ xlab("Date") +
  theme(text=element_text(size=9)) +
  ggtitle("Intracity Travel Intensity of Naning")

plotly_Naning <- ggplotly(plot_Naning)