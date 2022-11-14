Select *
From [Portfoglio Project]..CovidDeaths
Where continent is not null
order by 3,4

Select *
From [Portfoglio Project]..CovidVaccinations
Where continent is not null
order by 3,4

--Select Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
From [Portfoglio Project]..CovidDeaths
Where continent is not null
order by 1,2

-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in Italy

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From [Portfoglio Project]..CovidDeaths
Where Location like '%ital%'
and continent is not null
order by 1,2


--Looking at total cases vs population
--Shows what pecentage of population got Covid

Select Location, date, population, total_cases, (total_cases/population)*100 as Person_has_Covid_Percentage
From [Portfoglio Project]..CovidDeaths
Where Location like '%ital%'
and continent is not null
order by 1,2


--Looking at countrues with highest infection rate compared to population

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as Person_has_Covid_Percentage
From [Portfoglio Project]..CovidDeaths
--Where Location like '%ital%'
Where continent is not null
Group by Location, population
order by Person_has_Covid_Percentage desc


--Showing countries with highest death count per population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From [Portfoglio Project]..CovidDeaths
--Where Location like '%ital%'
Where continent is not null
Group by Location
order by TotalDeathCount desc


-- Now let's break things down by continent

-- Showing continents with the highest death count per population 

Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From [Portfoglio Project]..CovidDeaths
--Where Location like '%ital%'
Where continent is null
Group by location
order by TotalDeathCount desc


-- GLOBAL NUMBERS

--Per date
Select date, SUM(new_cases) as SUM_NEW_CASES, SUM(cast(new_deaths as int)) as SUM_NEW_DEATHS, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DEATH_PERCENTAGE
From [Portfoglio Project]..CovidDeaths
--Where Location like '%ital%'
Where continent is not null
Group by date
order by 1,2

--Without date
Select SUM(new_cases) as SUM_NEW_CASES, SUM(cast(new_deaths as int)) as SUM_NEW_DEATHS, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DEATH_PERCENTAGE
From [Portfoglio Project]..CovidDeaths
--Where Location like '%ital%'
Where continent is not null
order by 1,2


--Looking at total population vs vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
From [Portfoglio Project]..CovidDeaths dea
Join [Portfoglio Project]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
and dea.location like '%ital%'
order by 2,3


With PopuvsVacc (Continent, Location, Date, Population,New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
From [Portfoglio Project]..CovidDeaths dea
Join [Portfoglio Project]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
and dea.location like '%ital%'
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100 as RollingPVaccPercentage
From PopuvsVacc


--Temp table

DROP Table if exists #PercentagePopulationVaccinated
Create Table #PercentagePopulationVaccinated
(
Continent nvarchar(255),
Local nvarchar(255),
Date datetime,
Population numeric,
New_Vaccination numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentagePopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
From [Portfoglio Project]..CovidDeaths dea
Join [Portfoglio Project]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
and dea.location like '%ital%'
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100 as RollingPVaccPercentage
From #PercentagePopulationVaccinated


-- Creating view to store data for later visualizations

Create View PercentPopulationVaccinated as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
From [Portfoglio Project]..CovidDeaths dea
Join [Portfoglio Project]..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
and dea.location like '%ital%'
--order by 2,3


Select *
From PercentPopulationVaccinated