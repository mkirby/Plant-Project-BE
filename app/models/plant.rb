require 'rest-client'

class Plant < ApplicationRecord
  has_many :user_plants
  has_many :users, through: :user_plants

  def self.search_plants_by_query(query)
    api_response = RestClient.get("https://trefle.io/api/v1/plants/search?token=#{ENV['trefle_api_key']}&q=#{query}")
    api_data = JSON.parse(api_response)
  end

  def self.find_plant_by_slug(slug)
    api_response = RestClient.get("https://trefle.io/api/v1/plants/#{slug}?token=#{ENV['trefle_api_key']}")
    api_data = JSON.parse(api_response)
  end

  def self.plant_in_database?(id)
    Plant.find_by(api_id: id) ? true : false
  end

  def self.find_or_create_plant(plant_obj)
    if Plant.plant_in_database?(plant_obj[:api_id])
      existing_plant = Plant.find_by(api_id: plant_obj[:api_id])
    elsif
      new_plant = Plant.create(
        api_id: plant_obj[:api_id],
        slug: plant_obj[:slug]
      )
    end
  end

  
end
