class Api::V1::PlantsController < ApplicationController

  def create
    @plant = Plant.create(plant_params)
    if @plant.valid?
      render json: { plant: PlantSerializer.new(@plant) }, status: :created
    else
      render json: { error: 'failed to create plant' }, status: :not_acceptable
    end
  end

  def search
    @query = params[:q]
    @link = params[:link]
    if @query
      api_data = Plant.search_plants_by_query(@query)
    elsif @link
      api_data = Plant.find_plant_by_link(@link)
    end
    render json: { api_data: api_data }, status: :accepted

    # if query is bad or not present return different status
  end

  private

  def plant_params
    params.require(:plant).permit(:api_id)
  end

end
