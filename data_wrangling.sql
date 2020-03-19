-- Join table Summary and table search_telecommuting based on date
WITH case_China AS
(SELECT S.date, S.confirmed - S.cured - S.dead AS now_confirmed
 FROM Summary AS S
 WHERE S.country = 'China'AND S.province = '')

SELECT C.date as date, SUM(C.now_confirmed) AS confirmed, T.search_intensity as search_intensity
FROM case_China AS C, search_telecommuting AS T
WHERE C.date = T.date
GROUP BY C.date
ORDER BY C.date ASC;

-- Join table Summary and table search_Excel based on date
WITH case_China AS
(SELECT S.date, S.confirmed - S.cured - S.dead AS now_confirmed
 FROM Summary AS S
 WHERE S.country = 'China'AND S.province = '')

SELECT C.date as date, SUM(C.now_confirmed) AS confirmed, E.search_intensity as search_intensity
FROM case_China AS C, search_Excel AS E
WHERE C.date = E.date
GROUP BY C.date
ORDER BY C.date ASC;

-- Join table Summary and table search_Zoom based on date
WITH case_China AS
(SELECT S.date, S.confirmed - S.cured - S.dead AS now_confirmed
 FROM Summary AS S
 WHERE S.country = 'China'AND S.province = '')

SELECT C.date as date, SUM(C.now_confirmed) AS confirmed, Z.search_intensity as search_intensity
FROM case_China AS C, search_Zoom AS Z
WHERE C.date = Z.date
GROUP BY C.date
ORDER BY C.date ASC;


-- Find the first day when the number of confirmed cases exceeded 100
SELECT S.date
FROM Summary AS S
WHERE S.confirmed - S.dead - S.cured > 100 AND S.country = 'China' AND S.province = ''
ORDER BY S.date ASC
LIMIT 1;
-- 2020-01-18 is the first day when the number of confirmed was over 100

-- Find the first day in 2020 when Zoom was searched more than 10000 times
SELECT Z.search_intensity
FROM search_Zoom AS Z
WHERE Z.search_intensity > 10000 AND strftime('%Y', Z.date) = 2020
ORDER BY Z.date ASC
LIMIT 1;
-- 2020-01-31 is the first day in 2020 when Zoom was searched more than 100000 times

-- Find the first day in 2020 when "telecommuting" was searched more than 1000 times
SELECT T.date
FROM search_telecommuting AS T
WHERE T.search_intensity > 1000
ORDER BY T.date ASC
LIMIT 1;
-- 2020-01-31 is the first day when "telecommuting" was searched more than 1000 times

-- Find the date when confirmed cases reached the maximum value
SELECT S.date, MAX(S.confirmed - S.cured - S.dead) AS maximum
FROM Summary AS S
WHERE S.country = 'China'AND S.province = ''
-- On Feb 17, 2020, confirmed cases reached the maximum value
