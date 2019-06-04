require 'rest-client'
require 'json'
require 'pry'

def get_movie_data
  JSON.parse(RestClient.get('http://www.swapi.co/api/people/')) 
end

def show_available_characters
  data = []
  response_hash = get_movie_data
  response_hash["results"].each_with_index do |key,index|
    data << "#{index+1}. #{key["name"]}"
  end
  data
end

def get_character_movies_from_api(character_name, response_hash)
  film_hash = []
  response_hash["results"].each do |key|
    if key["name"].downcase == character_name
        key["films"].each do |film|
          # collect film API urls, make a web request to each URL to get the film data
          film_hash << JSON.parse(RestClient.get(film))
        end
    end
  end
  film_hash # array of hashes in which each hash is a given film
end

def print_movies(films)
  films.collect do |film|
    film["title"]
  end
end

def show_character_movies(character)
  response_hash = get_movie_data
  films = get_character_movies_from_api(character, response_hash)
  print_movies(films)
end
