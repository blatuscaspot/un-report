library(tidyverse)
getwd()
gapminder_data <- read.csv("data/gapminder_data.csv")
summarize(gapminder_data, averagelifeExp=mean(lifeExp), medianlifeExp=median(lifeExp))

#Learning to pipe- makes code more readable. piping makes whatever you are piping the default argument

gapminder_summary <- gapminder_data%>%
  summarize(averageLifeExp=mean(lifeExp))

# Filter (== is equal, != is except)
gapminder_data%>%
    filter(year == 1942)%>%
    summarize(average = mean(lifeExp))

#finding lowest year
gapminder_data%>%
  filter(year == min(year))%>%
  summarize(average = mean(lifeExp))

gapminder_data%>%
  filter(year == min(year))%>%
  summarize(Average_GDP = mean(gdpPercap))

#groupby() function groups by a variable

gapminder_data%>%
  group_by(year,continent)%>%
  summarize(average = mean(lifeExp),
      error = sd(lifeExp))

#adding more data from analysis (mutate function)

gapminder_data%>%
    mutate(gdp = pop * gdpPercap)
  
# finding total population in millions

gapminder_data%>%
    mutate(PopInMillions = pop / 1000000)
    
# Select - can be used to limit columns or remove columns
gapminder_data%>%
    select(pop, year)

gapminder_data%>%
    select(-continent)

# restructuring data

# Pivot_wider
gapminder_data%>%
  select(country, continent, year, lifeExp)%>%
  pivot_wider(names_from = year, values_from = lifeExp)

# working with messy data (CO2 data), c() means a little list
co2_emissions_dirty <- read_csv("co2-un-data.csv", skip = 2, 
         col_names = c("region", "country", "year", "series", "value", "footnotes", "source"))

# if you use the same name as an existing object using mutate() you will replace the object

co2_emissions<-co2_emissions_dirty%>%
    select(country, year, series, value)%>%
    mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions",
                           "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions"))%>%
  pivot_wider(names_from = series, values_from = value)%>%
  filter(year == 2005)%>%
  select(-year)


#bringing in 2007 population data
gapminder_data_2007 <- read_csv("data/gapminder_data.csv")%>%
  filter(year == 2007)%>%
  select(country, pop, lifeExp, gdpPercap)
joined_co2_pop <- inner_join(co2_emissions, gapminder_data_2007)

anti_join(co2_emissions, gapminder_data_2007)

full_join(co2_emissions, gapminder_data_2007)%>%
  View()
#left joins or right joins

co2_emissions%>%
  left_join(gapminder_data_2007)

#writing a CSV
write_csv(joined_co2_pop, file = "data/joined_co2_pop.csv")
