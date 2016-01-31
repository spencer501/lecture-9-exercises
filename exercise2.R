### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
install.packages('audio')
library(audio)

# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
top_track_search <- function(artist) {
  # Search base
  base <- 'https://api.spotify.com/v1/'
  
  # Search artist
  search_artist <- paste0(base, 'search?', 'q=', artist, '&type=artist')
  
  # Artist info 
  artist_info <- fromJSON(search_artist)
  artist_id <- artist_info$artists$items$id[1]
  
  # Get albums
  search_artists_albums <- paste0(base, 'artists/', artist_id, '/top-tracks?country=US')
  top_tracks <- fromJSON(search_artists_albums)
  return(top_tracks$tracks)
}

# What are the top 10 tracks by Nelly?
top_nelly <- top_track_search('Nelly')

# Save top_nelly
save(top_nelly, file="nelly_tracks.Rdata")

### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest
spotify_search <- function(type, string) {
  # Search base
  base <- 'https://api.spotify.com/v1/'
  
  # Search artist
  search <- paste0(base, 'search?', 'q=', string, '&type=', type)
  
  # Artist info 
  info <- fromJSON(search)
  return(info)
}

# Search albums with the word "Sermon"
spotify_search('album', 'Sermon')
