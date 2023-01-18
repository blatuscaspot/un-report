library(tidyverse)
gapminder_1997 <- read_csv("gapminder_1997.csv")
ggplot(data=gapminder_1997)+
  aes(x= gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y=lifeExp)+
  labs(y="Life Expectancy (years)")+
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?")+
  aes(color = continent) +
  scale_color_brewer(palette = "Set1")+
  aes(size = pop/1000000) +
  labs(size = "Population (in millions)")+
  aes(shape = continent)
  
  #Short handed ggplot
ggplot(data = gapminder_1997,
       aes(x = gdpPercap, y = lifeExp, color = continent,
           shape = continent, size = pop/10000)) +
  labs(x = "GDP Per Capita", y = "Life Expectancy",
       title = "Do people in wealthy countries live longer?",
       size = "Population (in millions)") +
    geom_point()
rm(gapminder_1997)

#Loading in more data
gapminder_data <- read_csv("gapminder_data.csv")
rm (dapminder_data)
gapminder_1997 <- read_csv ("gapminder_1997.csv")
View(gapminder_data)
dim(gapminder_data)
head(gapminder_1997)
head(gapminder_data)
tail(gapminder_data)

#predicting ggplot outputs
ggplot(data = gapminder_1997) +
  aes(x=continent, y=lifeExp, color=continent, fill = continent) +
  geom_violin()+
  geom_jitter(aes(size = pop/1000000))
#ideally we layer the geoms, each geom has its own aes 

#Histogram
ggplot(gapminder_1997)+
  aes(x= lifeExp)+
  labs(x = "Life Expectancy", y = "Years")+
  geom_histogram(bins = 20)+
  theme_prism()

#loading new prisms or themes
install.packages("ggprism")
library("ggprism")
?theme_prism

#making multiple plots in 1 go, ie facet_raps() or facet_grid()


ggplot(gapminder_1997)+
  aes(x = gdpPercap, y = lifeExp,) +
  labs(x = "GDP Per Capita", y = "Years" )+
    geom_point(size=1)+
    facet_grid(rows = vars(continent))

ggsave(file = "cool_prism_plot.tiff.png",plot = lifeExp_hist_prism,
       file = "cool_prism_plot.png",
       device = "png",
       width = 4, height = 4)
    
    
# saving plots
ggsave("awesome_plot.tiff", device = tiff, width = 6, height = 4, units = "in")
?ggsave
