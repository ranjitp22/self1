#Worksheet 6

library(tidyverse)
library(rvest)

### 1 #########################
html <- read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")
name <- html_elements(html , ".head2")
head(name)

name <- html_text(name)
name



### 2 #########################

html <- read_html("https://www.imdb.com/chart/top/")
name <- html_elements(html , ".titleColumn a")
name
movies_name <- html_text(name)
movies_name


### 3 #########################

#extracting Movie year
html <- read_html("https://www.imdb.com/chart/top/")
name <- html_elements(html , ".secondaryInfo")
name
movie_year <- html_text(name)
for (i in 1:length(movie_year))
{
  movie_year[i] <- substring(movie_year[1],1,4)
}
movie_year

#extracting rating
html <- read_html("https://www.imdb.com/chart/top/")
name <- html_elements(html , ".ratingColumn strong ")
movie_rating <- html_text(name)
movie_rating <- as.numeric(movie_rating)
movie_rating

#retracting votes
html <- read_html("https://www.imdb.com/chart/top/")
name <- html_elements(html , ".posterColumn span ")

name <- html_elements(name, ".nv")
head(name)

?html_attr
#dataframe
df <- data.frame(movies_name,movie_year,movie_rating)
head(df)
df$movies_name
