# COVID-19
## Data Source
I used web crawler to extract the following data:
- Population movement in cities: [Baidu Map](http://qianxi.baidu.com/) .
- Search intensity of the word "Zoom": [Baidu Index of Zoom](http://index.baidu.com/v2/main/index.html#/trend/zoom?words=zoom)
- Search intensity of the word "Excel": [Baidu Index of Excel](http://index.baidu.com/v2/main/index.html#/trend/excel?words=excel)
- Search intensity of the word "telecommuting": [Baidu Index of telecommuting](http://index.baidu.com/v2/main/index.html#/trend/%E8%BF%9C%E7%A8%8B%E5%8A%9E%E5%85%AC?words=%E8%BF%9C%E7%A8%8B%E5%8A%9E%E5%85%AC)
- Intra-city travel intensity: [Intra-city Travel intensity](https://qianxi.baidu.com/)

I also extracted the data on history of confirmed cases in different countries from R package: [nCov2019](https://github.com/canghailan/Wuhan-2019-nCoV)

## Motivation
Here I want to study how the outbreak of COVID-19 impacted the lives of people from the lens of work, study, and travelling.
Facing the difficulty of retrieving direct data of how people lived, I chose to analyze search queries which I believe could reflect social behaviors to some extent. "Excel", "Telecommuting", "Zoom" were three key queries I chose to study, because they all represented significant changes during the epidemic. 

## Data Wrangling
- Join table Summary with table search_Zoom, table search_Excel, table search_telecommuting based on date
- Find the first day when the number of confirmed cases exceeded 100
- Find the first day in 2020 when Zoom was searched more than 10000 times
- Find the first day in 2020 when "telecommuting" was searched more than 1000 times
- Find the date when confirmed cases reached the maximum value

## Visualization
- Visualized the trends of search intensity of Excel, Telecommuting, Zoom and compaired the trends to that of confirmed cases.

## Report 
Here's my [report](https://rpubs.com/Ciel_Zhao/586497).
