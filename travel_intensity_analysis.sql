-- Here I want to analyze the impact of COVID-19 on intracity travel intensity.
-- I choose three big cities(Shanghai, Beijing, Guangzhou),
-- three small cities (Naning, Wuxi, Guiyang) and Wuhan to analyze.
-- Since the virus happened during the Chinese New Year holiday,
-- there are two variables that may affect people's travel:
-- holiday and COVID-19.
-- To only analyze the effect of the virus and elimiate the holiday's effect on travel intensity,
-- I compare the difference of the decline(prior to the Eve and after the Eve) in travel intensity
-- for the last year and this year during the same period
-- If the difference for 2020 is bigger than that for 2019, it means the travel is impacted by the virus.
-- When comparing the travel intensity decline for 2019 and 2020, I need to adjust
-- the time lines for 2019 and 2020 to the same level based on the Lunar calendar.
-- For example,
-- New Year's Eve in 2019: Feb 4th; New Year's Eve in 2020: Jan 24th.
-- They were on the same dates based on Lunar Calendar, but different dates
-- based on Solar/nomal calendar.
-- To unify the timeline, I construct a relative time series that was based on Lunar calendar
-- The time series starts from the day two weeks prior to the Chinese New Year's Eve
-- and ends at the day two weeks after the Eve.
-- The date of the Chinese New Year's Eve is set to be 0 in the time series,
-- which means the day before the Eve was -1, and the day after the Eve was 1.


-- New Year's Eve in 2019: Feb 4th; New Year's Eve in 2020: Jan 24th.
-- I select the period  from Jan 21th,2019 to Feb 18th, 2019 (two weeks before and after the Eve in 2019).
-- and also from Jan 10th,2020 to Feb 7th,2020 (two weeks before and after the Eve in 2020).
-- Please note that the original data for 2019 and 2020 has already been joined together
-- based on lunar date



-- For Wuhan
-- calculate the average travel_intensity
-- during the two weeks before the Chinese New Eve for 2019 and 2020
SELECT AVG(W.intensity1) AS avg_2020, AVG(W.intensity2) AS avg_2019
FROM travel_Wuhan AS W
WHERE (W.date1 >= 20200110 AND W.date2 >= 20190121) --two weeks prior to the Eve
AND (W.date1 < 20200124 AND W.date2 < 20190204) -- for 2019 and 2020
-- average travel_intensity before the New Year Eve for 2019: 3.62976428571429
-- average travel_intensity before the New Year Eve for 2020: 4.27857142857143

-- calculate the average travel_intensity
-- during the two weeks after the Chinese New Eve for 2019 and 2020
SELECT AVG(W.intensity1) AS avg_2020, AVG(W.intensity2) AS avg_2019
FROM travel_Wuhan AS W
WHERE (W.date1 > 20200124 AND W.date2 > 20190204) --two weeks after the Eve
AND (W.date1 <= 20200207 AND W.date2 <= 20190218) -- for 2019 and 2020
-- average travel_intensity after the New Year Eve for 2019: 2.81122142857143
-- average travel_intensity after the New Year Eve for 2020: 0.67834285714286

-- change in travel intensity after the new Year holiday:
-- Δ2019 = 2.81122142857143 - 3.62976428571429 = -0.81854285714
-- Δ2020 = 0.67834285714286 - 4.27857142857143 = -3.60022857143

-- It showed that intracity travel intensity of Guangzhou declined more in 2020
-- than in 2019 around Chinese New Year.
-- Change in decline of travel intensity for Guangzhou:
-- Δ2020 - Δ2019 = -3.60022857143 - (-0.81854285714) = -2.78168571429


-- For Shanghai
-- calculate the average travel_intensity
-- during the two weeks before the Chinese New Eve for 2019 and 2020 in Shanghai
SELECT AVG(S.intensity1) AS avg_2020, AVG(S.intensity2) AS avg_2019
FROM travel_Shanghai AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 < 20200124 AND S.date2 < 20190204) -- for 2019 and 2020
-- average travel_intensity before the New Year Eve for 2019: 4.4427429
-- average travel_intensity before the New Year Eve for 2020: 5.4685786


-- calculate the average travel_intensity
-- during the two weeks after the Chinese New Eve for 2019 and 2020
SELECT AVG(S.intensity1) AS avg_2020, AVG(S.intensity2) AS avg_2019
FROM travel_Shanghai AS S
WHERE (S.date1 > 20200124 AND S.date2 > 20190204) --two weeks after the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- for 2019 and 2020
-- average travel_intensity after the New Year Eve for 2019: 3.23265
-- average travel_intensity after the New Year Eve for 2020: 1.6270071

-- change in travel intensity after the new Year holiday:
-- Δ2019 =  3.23265 -  4.4427429 = -1.2100929
-- Δ2020 = 1.6270071 - 5.4685786 = -3.8415715
-- It showed that intracity travel intensity of Shanghai declined more in 2020
-- than in 2019 around Chinese New Year.
-- Change in decline of travel intensity for Shanghai:
-- Δ2020 - Δ2019 = -3.8415715 - (-1.2100929) = -2.6314786

-- For Beijing
-- calculate the average travel_intensity
-- during the two weeks before the Chinese New Eve for 2019 and 2020
SELECT AVG(B.intensity1) AS avg_2020, AVG(B.intensity2) AS avg_2019
FROM travel_Beijing AS B
WHERE (B.date1 >= 20200110 AND B.date2 >= 20190121) --two weeks prior to the Eve
AND (B.date1 < 20200124 AND B.date2 < 20190204) -- for 2019 and 2020
-- average travel_intensity before the New Year Eve for 2019: 4.23622857142857
-- average travel_intensity before the New Year Eve for 2020: 5.34199285714286

-- calculate the average travel_intensity
-- during the two weeks after the Chinese New Eve for 2019 and 2020
SELECT AVG(B.intensity1) AS avg_2020, AVG(B.intensity2) AS avg_2019
FROM travel_Beijing AS B
WHERE (B.date1 > 20200124 AND B.date2 > 20190204) --two weeks after the Eve
AND (B.date1 <= 20200207 AND B.date2 <= 20190218) -- for 2019 and 2020
-- average travel_intensity after the New Year Eve for 2019: 3.06512857142857
-- average travel_intensity after the New Year Eve for 2020: 1.54076428571429

-- change in travel intensity after the new Year holiday:
-- Δ2019 = 3.06512857142857 - 4.23622857142857 = -1.1711
-- Δ2020 = 1.54076428571429 - 5.34199285714286 = -3.80122857143
-- It showed that intracity travel intensity of Beijing declined more in 2020
-- than in 2019 around Chinese New Year.
-- Change in decline of travel intensity:
-- Δ2020 - Δ2019 = -3.80122857143 - (-1.1711) = -2.63012857143

-- For Guangzhou
-- calculate the average travel_intensity
-- during the two weeks before the Chinese New Eve for 2019 and 2020
SELECT AVG(G.intensity1) AS avg_2020, AVG(G.intensity2) AS avg_2019
FROM travel_Beijing AS G
WHERE (G.date1 >= 20200110 AND G.date2 >= 20190121) --two weeks prior to the Eve
AND (G.date1 < 20200124 AND G.date2 < 20190204) -- for 2019 and 2020
-- average travel_intensity before the New Year Eve for 2019: 4.23622857142857
-- average travel_intensity before the New Year Eve for 2020: 5.34199285714286


-- calculate the average travel_intensity
-- during the two weeks after the Chinese New Eve for 2019 and 2020
SELECT AVG(G.intensity1) AS avg_2020, AVG(G.intensity2) AS avg_2019
FROM travel_Guangzhou AS G
WHERE (G.date1 > 20200124 AND G.date2 > 20190204) --two weeks after the Eve
AND (G.date1 <= 20200207 AND G.date2 <= 20190218) -- for 2019 and 2020
-- average travel_intensity after the New Year Eve for 2019: 2.399
-- average travel_intensity after the New Year Eve for 2020: 1.01692857142857

-- change in travel intensity after the new Year holiday:
-- Δ2019 = 2.399 - 4.23622857142857 = -1.83722857143
-- Δ2020 = 1.01692857142857 - 5.34199285714286 = -4.32506428571

-- It showed that intracity travel intensity declined more in 2020
-- than in 2019 around Chinese New Year.
-- Change in decline of travel intensity:
-- Δ2020 - Δ2019 = -4.32506428571 - (-1.83722857143) = -2.48783571428


-- For Wuxi
-- calculate the average travel_intensity
-- during the two weeks before the Chinese New Eve for 2019 and 2020
SELECT AVG(W2.intensity1) AS avg_2020, AVG(W2.intensity2) AS avg_2019
FROM travel_Wuxi AS W2
WHERE (W2.date1 >= 20200110 AND W2.date2 >= 20190121) --two weeks prior to the Eve
AND (W2.date1 < 20200124 AND W2.date2 < 20190204) -- for 2019 and 2020
-- average travel_intensity before the New Year Eve for 2019: 4.48442142857143
-- average travel_intensity before the New Year Eve for 2020: 5.46537142857143


-- calculate the average travel_intensity
-- during the two weeks after the Chinese New Eve for 2019 and 2020
SELECT AVG(W2.intensity1) AS avg_2020, AVG(W2.intensity2) AS avg_2019
FROM travel_Wuxi AS W2
WHERE (W2.date1 > 20200124 AND W2.date2 > 20190204) --two weeks after the Eve
AND (W2.date1 <= 20200207 AND W2.date2 <= 20190218) -- for 2019 and 2020
-- average travel_intensity after the New Year Eve for 2019: 3.51741428571429
-- average travel_intensity after the New Year Eve for 2020: 1.83156428571429

-- change in travel intensity after the new Year holiday:
-- Δ2019 = 3.51741428571429 - 4.48442142857143 = -0.96700714285
-- Δ2020 = 1.83156428571429 - 5.46537142857143 = -3.63380714286

-- It showed that intracity travel intensity declined more in 2020
-- than in 2019 around Chinese New Year.
-- Change in decline of travel intensity:
-- Δ2020 - Δ2019 = -3.63380714286 - (-0.96700714285) = -2.66680000001



-- For Guiyang
-- calculate the average travel_intensity
-- during the two weeks before the Chinese New Eve for 2019 and 2020
SELECT AVG(G.intensity1) AS avg_2020, AVG(G.intensity2) AS avg_2019
FROM travel_Guiyang AS G
WHERE (G.date1 >= 20200110 AND G.date2 >= 20190121) --two weeks prior to the Eve
AND (G.date1 < 20200124 AND G.date2 < 20190204) -- for 2019 and 2020
-- average travel_intensity before the New Year Eve for 2019: 3.77815
-- average travel_intensity before the New Year Eve for 2020: 4.57931428571429


-- calculate the average travel_intensity
-- during the two weeks after the Chinese New Eve for 2019 and 2020
SELECT AVG(G.intensity1) AS avg_2020, AVG(G.intensity2) AS avg_2019
FROM travel_Guiyang AS G
WHERE (G.date1 > 20200124 AND G.date2 > 20190204) --two weeks after the Eve
AND (G.date1 <= 20200207 AND G.date2 <= 20190218) -- for 2019 and 2020
-- average travel_intensity after the New Year Eve for 2019: 3.06292142857143
-- average travel_intensity after the New Year Eve for 2020: 1.83585714285714

-- change in travel intensity after the new Year holiday:
-- Δ2019 = 3.06292142857143 - 3.77815 = -0.71522857142
-- Δ2020 = 1.83585714285714 - 4.57931428571429 = -2.74345714286

-- It showed that intracity travel intensity declined more in 2020
-- than in 2019 around Chinese New Year.
-- Change in decline of travel intensity:
-- Δ2020 - Δ2019 = -2.74345714286 - (-0.71522857142) = -2.02822857144



-- For Naning
-- calculate the average travel_intensity
-- during the two weeks before the Chinese New Eve for 2019 and 2020
SELECT AVG(N.intensity1) AS avg_2020, AVG(N.intensity2) AS avg_2019
FROM travel_Naning AS N
WHERE (N.date1 >= 20200110 AND N.date2 >= 20190121) --two weeks prior to the Eve
AND (N.date1 < 20200124 AND N.date2 < 20190204) -- for 2019 and 2020
-- average travel_intensity before the New Year Eve for 2019: 4.51761428571429
-- average travel_intensity before the New Year Eve for 2020: 5.03841428571428


-- calculate the average travel_intensity
-- during the two weeks after the Chinese New Eve for 2019 and 2020
SELECT AVG(N.intensity1) AS avg_2020, AVG(N.intensity2) AS avg_2019
FROM travel_Naning AS N
WHERE (N.date1 > 20200124 AND N.date2 > 20190204) --two weeks after the Eve
AND (N.date1 <= 20200207 AND N.date2 <= 20190218) -- for 2019 and 2020
-- average travel_intensity after the New Year Eve for 2019: 3.79556428571429
-- average travel_intensity after the New Year Eve for 2020: 2.05617142857143

-- change in travel intensity after the new Year holiday:
-- Δ2019 = 3.79556428571429 - 4.51761428571429 = -0.72205
-- Δ2020 = 2.05617142857143 - 5.03841428571428 = -2.98224285714

-- It showed that intracity travel intensity declined more in 2020
-- than in 2019 around Chinese New Year.
-- Change in decline of travel intensity:
-- Δ2020 - Δ2019 = -2.98224285714 - (-0.72205) = -2.26019285714


-- tables for data visualization
SELECT *
FROM travel_Shanghai AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- two weeks after the Eve
-- this table is for data visualization

SELECT *
FROM Travel_Beijing AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- two weeks after the Eve


SELECT *
FROM Travel_Guangzhou AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- two weeks after the Eve


SELECT *
FROM Travel_Wuxi AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- two weeks after the Eve


SELECT *
FROM travel_Guiyang AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- two weeks after the Eve


SELECT *
FROM travel_Naning AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- two weeks after the Eve



SELECT *
FROM Travel_Wuhan AS S
WHERE (S.date1 >= 20200110 AND S.date2 >= 20190121) --two weeks prior to the Eve
AND (S.date1 <= 20200207 AND S.date2 <= 20190218) -- two weeks after the Eve
