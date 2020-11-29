class UserPlantSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :plant_id, :plant

  def plant
    puts object.plant
    PlantSerializer.new(object.plant, { root: false } )
  end
  
end
