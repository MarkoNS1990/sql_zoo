-- SELECT BASICS
SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000    

-- SELECT FROM WORLD
SELECT name, continent, population FROM world

SELECT name
  FROM world
WHERE population > 1000000000

SELECT name, gdp/population
FROM world
WHERE population > 200000000

SELECT name,population / 1000000
FROM world
WHERE continent = 'South America'

SELECT name,population
FROM world
WHERE name IN('France','Germany','Italy')

SELECT name
FROM world
WHERE name LIKE '%united%'

SELECT name,population,area 
from world
WHERE area > 3000000 OR population > 250000000

SELECT name, population, area
FROM world
WHERE ((population > 250000000) OR (area > 3000000)) 
AND NOT ((population > 250000000) AND (area > 3000000))

SELECT name,ROUND(population/1000000,2),ROUND(GDP/1000000000,2)
FROM world
WHERE continent = 'South America'

SELECT name,ROUND(GDP/population,-3)
FROM world
WHERE GDP > 1000000000000

SELECT name,capital
FROM world
WHERE LEN(name) = LEN(capital)

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND
name <> capital

SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'

-- SELECT FROM NOBEL

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr,subject
FROM nobel
WHERE winner = 'Albert Einstein' 

SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject = 'Peace'

SELECT yr,subject,winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989 
AND subject = 'Literature'

SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Barack Obama','Jimmy Carter')

SELECT winner
FROM nobel
WHERE winner like 'John%'

SELECT yr,subject,winner
FROM nobel
WHERE subject = 'Physics' AND yr = '1980'
OR ​subject = 'Chemistry' AND yr = '1984'

SELECT yr,subject,winner 
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('chemistry','medicine')

SELECT yr,subject,winner
FROM nobel
WHERE yr < 1910 AND subject = 'medicine'
OR
yr >= 2004 AND subject = 'literature'

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

SELECT *
FROM nobel
WHERE winner LIKE'EUGENE O''NEILL'

SELECT winner,yr,subject
FROM nobel
WHERE winner LIKE 'Sir%' ORDER BY yr DESC,winner

-- SELECT IN SELECT
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population >
(SELECT GDP/POPULATION FROM world 
WHERE name = 'United Kingdom')

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina','Australia'))
ORDER BY name

SELECT name,population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland')