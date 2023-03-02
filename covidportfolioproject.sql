SELECT*
FROM PORTFOLIADATABASE..COVIDDEATH
where continent is not null
ORDER BY 3,4
--SELECT*
--FROM PORTFOLIADATABASE..COVIDVACCINE
--ORDER BY 3,4
 SELECT LOCATION, DATE, NEW_CASES, TOTAL_CASES, TOTAL_DEATHS, POPULATION
 FROM PORTFOLIADATABASE..COVIDDEATH
 ORDER BY 1,2


--TOTAL CASES VS TOTAL DEATH
SELECT LOCATION, DATE, TOTAL_DEATHS, TOTAL_CASES, (total_deaths/total_cases)*100 AS DEATHPRECENTAGE
FROM PORTFOLIADATABASE..COVIDDEATH
WHERE location LIKE '%EGYPT%'
ORDER BY 1,2

--TOTAL CASES VS POPULATION :
SELECT LOCATION, DATE, population, TOTAL_CASES, (total_cases/population)*100 AS INFECTEDPRECENTAGE
FROM PORTFOLIADATABASE..COVIDDEATH
WHERE location LIKE '%EGYPT%'
ORDER BY 1,2

--THE HIGHEST INFECTION RATE COUNTRIES
SELECT LOCATION, population, MAX(TOTAL_CASES) AS HIGHESTRATE, MAX((total_cases/population))*100 AS HIGHESTINFECTIONPRECENTAGE
FROM PORTFOLIADATABASE..COVIDDEATH
--WHERE location LIKE '%EGYPT%'
GROUP BY location, population
ORDER BY HIGHESTINFECTIONPRECENTAGE DESC

--continents WITH HIGHEST DEATH RATE
SELECT continent, MAX(CAST(TOTAL_DEATHS AS INT)) AS TOTALDAETHRATE
FROM PORTFOLIADATABASE..COVIDDEATH
where continent is not null
GROUP BY continent
ORDER BY TOTALDAETHRATE DESC 
  

  --international numbers:
  Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PORTFOLIADATABASE..COVIDDEATH
where continent is not null 
--Group By date
order by 1,2

--total vaccination vs population
select*
from PORTFOLIADATABASE..COVIDVACCINE
 select*
 from PORTFOLIADATABASE..COVIDDEATH
 join PORTFOLIADATABASE..COVIDVACCINE
 on COVIDDEATH.location = COVIDVACCINE.location
 and COVIDDEATH.date = COVIDVACCINE.date

 --create view to store later
 create view tdeaths as
  Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PORTFOLIADATABASE..COVIDDEATH
where continent is not null 
Group By date
--order by 1,2
select*
from tdeaths