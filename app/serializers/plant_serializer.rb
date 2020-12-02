class PlantSerializer < ActiveModel::Serializer
  attributes :id, :api_id, :slug#, :api

  # can use if we need to return api data with each plant
  def api
    Plant.find_plant_by_slug(self.object.slug)
  end
end
