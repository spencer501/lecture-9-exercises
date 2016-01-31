### Lecutre 9: APIs ###
library(dplyr)

# Quick google maps example --------------------------
# install.packages('ggmap')
library(ggmap)
qmap('Seattle')

# Simple Spotify API example --------------------------
# Base URL for searching the API
base <- 'https://api.spotify.com/v1/search?'

# Parameters
search <- 'q=adele'
type <- '&type=artist'

# Query string
query_url <- paste0(base, search, type)

# Read in data
library(jsonlite)
data <- fromJSON(query_url)


# Flattening data.frames ----------------
# Let's do something silly
people <- data.frame(names = c('Spencer', 'Jessica', 'Keagan'))
favorites <- data.frame(
  food = c('Pizza', 'Pasta', 'salad'), 
  music = c('Bluegrass', 'Indie', 'Electronic')
)
people$favorites <- favorites

# Columns of our people data.frame
names(people)

# Flatten it!
flattened <- flatten(people)
names(flattened)
