gapminder<-readr::read_csv("data/gapminder/raw/gapminder_data.csv")
mean(gapminder$"gdpPercap"[gapminder$continent=="Africa"])

require(tidyverse)
d1<-filter(gapminder,country=="Japan")

d1<-gapminder %>%
  group_by(country) %>%
  summarize(meanlife = mean(lifeExp)) %>%
  arrange(-meanlife)
  
d1

gapminder %>%
  filter(country=="Japan")%>%
  ggplot(aes(year,lifeExp))+
  geom_line()

gap_wide <- gapminder %>%
  gather(key = 'key', value = 'value', c('pop', 'lifeExp', 'gdpPercap')) %>%
  mutate(year_var = paste(key, year, sep = '_')) %>%
  select(country, continent, year_var, value) %>%
  spread(key = 'year_var', value = 'value')

structure(gap_wide)
str(gap_wide)

gap_long <- gap_wide %>%
  gather(k=obstype_year,
         value=obs_values,
         -continent,-country)
gap_long

#separate take apart runon data
#as_numeric takes str to number

dim(gap_wide)
dim(gap_long)
