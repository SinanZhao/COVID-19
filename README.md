# COVID-19 in China
## Data Source
I used web crawler to extract the following data:
- Search intensity of the word "Zoom": [Baidu Index of Zoom](http://index.baidu.com/v2/main/index.html#/trend/zoom?words=zoom)
  It tracks the number of times that "Zoom" was searched from 2011 to 2020.
- Search intensity of the word "Excel": [Baidu Index of Excel](http://index.baidu.com/v2/main/index.html#/trend/excel?words=excel)
  It tracks the number of times that "Excel" was searched from 2011 to 2020.
- Search intensity of the word "telecommuting": [Baidu Index of telecommuting](http://index.baidu.com/v2/main/index.html#/trend/%E8%BF%9C%E7%A8%8B%E5%8A%9E%E5%85%AC?words=%E8%BF%9C%E7%A8%8B%E5%8A%9E%E5%85%AC)
  It tracks the number of times that "telecommuting" was searched from 2011 to 2020.
- Intra-city travel intensity: [Intra-city Travel intensity](https://qianxi.baidu.com/)
   It tracks the intra-city travel intensity of different cities from 2019 to 2020.

I also extracted the data on history of confirmed cases in different countries from R package: [nCov2019](https://github.com/canghailan/Wuhan-2019-nCoV)

## Motivation
Here I want to study how the outbreak of COVID-19 impacted the lives of Chinese people from the lens of work, study, and travelling.
Facing the difficulty of retrieving direct data that could reveal how people lived, I chose to analyze search queries which I believe could reflect social behaviors. First, I brainstormed some search queries that were closely related to people's daily lives, then I sorted them into the following categories: work, study and social activities. There were "flight tickets", "telecommuting", "Excel", "lookup", "Excel", "quarantine" etc. Then I chose the most representative term in each category. In the work category, I chose "Excel" because Excel was the most common office software that people use, and more importantly, people search Excel formula frequently, so it's a good indicator of work during the epidemic. After the outbreak, many companies and shops shut down and people stopped working. Then at some point many companies adopted a new way for employers to work: telecommuting, so I also analyzed the search term "telecommuting". Even though I had the hypothesis that the search for "Excel"and "telecommuting" might be correlated, I still wanted to know more about when the change happened and why it happened. In study category, "Zoom" was chosen because most online classes were provided via Zoom and the search for "Zoom" could show how students change the way of studying. For social activities, I wanted to know how the virus impacted people's travelling, so I also analyzed the introcity travel intensity. 

## Data Wrangling
### Search term for "Excel", "telecommuting" and "Zoom"
- Join table Summary with table search_Zoom, table search_Excel, table search_telecommuting based on date
- Find the first day when the number of confirmed cases exceeded 100
- Find the first day in 2020 when Zoom was searched more than 10000 times
- Find the first day in 2020 when "telecommuting" was searched more than 1000 times
- Find the date when confirmed cases reached the maximum value

### Intracity Travel Intensity 
Here I want to analyze the impact of COVID-19 on intracity travel intensity. I chose three big cities(Shanghai, Beijing, Guangzhou), three small cities (Naning, Wuxi, Guiyang) and Wuhan(the city with the most confirmed cases) to analyze because cities chosen were more representative, which would lead to more general conclusions. 
In the first beginning, I planned to compare the intracity travel intensity before the outbreak of COVID-19 and after the outbreak.
If the intensity decreased significantly, then I would conclude that the COVID-19 affected travel intensity.
However, then I realized one problem: 
The outbreak of COVID-19 occurred during the Chinese New Year holiday. During the Chinese New Year holiday, the travel intensity tend to decline than normal significantly even without the impact of the virus.

Then I tried another way: comparing the intensity level for 2020 to that for 2019 during the Chinese New Year holiday.
If the travel intensity was much lower in 2020 than in 2019, then I would conclude that the COVID-19 affected the travel intensity.
Yet I realized another problem: there may be more or less people living in these cities this year than last year. Hence, I couldn't compare the intensity between these two years directly to draw any conclusions, since the population bases were different.

I eventually decided to compare the decline in travel intensity for 2020 to that for 2019.
Another problem was I couldn't compare the intensity in two years based on the Solar calendar due to the impact of the Chinese New Year holiday. For example, it was meaningless to compare the intensity on Jan 24 between 2020 and 2019. Since on Jan 24, 2020, it was Chinese New Year's Eve and the travelling intensity would be higher than normal, whereas on Jan 24, 2020, no special events occurred and the travel intensity was just normal (Chinese New Year occurrs at different time in different years, according to the Lunar calendar). Hence, the best way to compare 2019 and 2020 was to construct a new time line according to the Lunar calendar. 
That's why I looked at the time period from Jan 10th,2020 to Feb 7th, 2020 (two weeks before and after the Chinese New Year's Eve in 2020), and the period from Jan 21th,2019 to Feb 18th, 2019 (two weeks before and after the Chinese New Year's Eve in 2019).
During these periods, the travel intensity declined more in 2020 than 2019, then I would conclude that COVID-19 affected travel intensity. I think in this way it could eliminate the impact of the holiday and the difference in population base.

Here's the result:
 City     | Decline in 2019  | Decline in 2020  | Change in decline between 2020 and 2019   
 -------- | :-----------:    | :-----------:    | :-----------:|
 Wuhan    | 0.8186           | 3.6002           | 2.7817       |
 Shanghai | 1.2101           | 3.8416           | 2.6315       |
 Beijing  | 1.1711           | 3.8012           | 2.6301       |
 Guangzhou| 1.8372           | 4.3250           | 2.4878       |
 Naning   | 0.72205          | 2.9822           | 2.2602       |
 Wuxi     | 0.9670           | 3.6338           | 2.6668       |
 Guiyang  | 0.7152           | 2.7435           | 2.0282       |

Based on the table above, we can tell that the intracity travel intensity declined in 2020 more than 2019 for all the cities.
It implies that the COVID-19 impacted people's travelling and decreased the travel intensity.
It obviously made an bigger impact on Wuhan than other cities, since the change in decline between 2020 and 2019 was biggest in Wuhan among all the cities.
I had assumed that big cities may be impacted more than small cities, however, it was not completely true based on the table above. 
We can tell that the COVID-19 made a bigger impact on Shanghai and Beijing than most small cities, but there was an excpetion, Wuxi, that had larger change in decline than those three big cities.
Here are some possible reasons: First, during the outrbreak, people across the whole country were discouraged from going out. It was very inconvenient to go out since people had to take temperature whenever they went, and in some places people also needed to show their ids for records. Hence, it's reasonable that there were not big differences among different cities, since the impact on travelling didn't depend on whether it's a big city, but depend on the national policy. However, despite the national policy, the degree of implementation varied by region. Some local governments ensured more effective implementation of the policy by providing more healthcare publicity and more strict monitor, and people in those cities would reduce the times of travelling. Cities with severe epidemic would also had low travel intensity no matter how big the city is, just like Wuhan.


## Visualization
- Visualized the trends of search intensity of Excel, Telecommuting, Zoom and compaired the trends to that of confirmed cases.

## Report 
Here's my [report](https://rpubs.com/Ciel_Zhao/586497).
