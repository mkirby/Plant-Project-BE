require 'rest-client'

class Plant < ApplicationRecord
  has_many :user_plants
  has_many :users, through: :user_plants

  def self.search_plants_by_query(query)
    api_response = RestClient.get("https://trefle.io/api/v1/plants/search?token=#{ENV['trefle_api_key']}&q=#{query}")
    api_data = JSON.parse(api_response)
  end

  def self.find_plant_by_link(link)
    api_response = RestClient.get("https://trefle.io#{link}?token=#{ENV['trefle_api_key']}")
    api_data = JSON.parse(api_response)
  end
  
end
