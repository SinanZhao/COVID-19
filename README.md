# COVID-19
## Data Source
I used web crawler to extract the following data:
- Population movement in cities: [Baidu Map](http://qianxi.baidu.com/) .
- Search intensity of the word "Zoom": [Baidu Index of Zoom](http://index.baidu.com/v2/main/index.html#/trend/zoom?words=zoom)
- Search intensity of the word "Excel": [Baidu Index of Excel](http://index.baidu.com/v2/main/index.html#/trend/excel?words=excel)
- Search intensity of the word "telecommuting": [Baidu Index of telecommuting](http://index.baidu.com/v2/main/index.html#/trend/%E8%BF%9C%E7%A8%8B%E5%8A%9E%E5%85%AC?words=%E8%BF%9C%E7%A8%8B%E5%8A%9E%E5%85%AC)

I also extracted the data on history of confirmed cases in different countries from R package: [nCov2019](https://github.com/GuangchuangYu/nCov2019)

## Data Wrangling
- Join table Summary with table search_Zoom, table search_Excel, table search_telecommuting based on date

## Visualization

