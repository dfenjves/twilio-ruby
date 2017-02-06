require 'httparty'
require 'json'
require 'pry'

# puts "what do you want to look up?"
# query = gets.chomp
#
# puts "How many gifs are you looking for?"
# num_of_gifs = gets.chomp
#
# new_query = query.gsub(" ", "+")
#
# response = HTTParty.get("https://api.giphy.com/v1/gifs/search?q=#{new_query}&limit=#{num_of_gifs}&api_key=dc6zaTOxFJmzC")


class Giphy
    BASE_URL = "https://api.giphy.com/v1/gifs"

  def self.search(query)
    response = HTTParty.get("#{BASE_URL}/search?q=#{query}&api_key=dc6zaTOxFJmzC")
    parsed_response = JSON.parse(response.body)

    parsed_response['data'].collect do |gifs|
        gifs['url']
    end

  end

  def self.mms_search(query)
    response = HTTParty.get("#{BASE_URL}/search?q=#{query}&api_key=dc6zaTOxFJmzC")
    parsed_response = JSON.parse(response.body)

    parsed_response['data'][0]['images']['fixed_height_downsampled']['url']
  end

  def self.trending()
    response = HTTParty.get("#{BASE_URL}/trending?api_key=dc6zaTOxFJmzC")
    parsed_response = JSON.parse(response.body)

    parsed_response['data'].map do |gifs|
      gifs['url']
    end

  end
end
