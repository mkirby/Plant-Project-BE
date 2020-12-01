class Api::V1::PlantsController < ApplicationController

  def create
    @plant = Plant.find_or_create_plant(plant_params)
    if @plant.valid?
      render json: { plant: PlantSerializer.new(@plant) }, status: :created
    else
      render json: { error: 'failed to create plant' }, status: :not_acceptable
    end
  end

  def search
    @query = params[:q]
    if @query
      api_data = Plant.search_plants_by_query(@query)
    end
    render json: { api_data: api_data }, status: :accepted

    # if query is bad or not present return different status
  end
  
  def plant_info
    @slug = params[:slug]
    if @slug
      api_data = Plant.find_plant_by_slug(@slug)
    end
    render json: { api_data: api_data }, status: :accepted
  end

  private

  def plant_params
    params.require(:plant).permit(:api_id, :slug)
  end

end
