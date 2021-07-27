require_relative 'scraper'
require 'yaml'

top_movie_links = top_links
top_movies = top_movie_links.map { |link| scrape_movie(link) }

yaml_string = top_movies.to_yaml

File.open('movies.yml', 'wb') do |file|
    file.write(yaml_string)
end