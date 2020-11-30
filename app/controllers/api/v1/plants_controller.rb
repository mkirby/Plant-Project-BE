class Api::V1::PlantsController < ApplicationController

  def search
    query = params[:q]
    if query
      api_data = Plant.search_plants_by_query(query)
      render json: { api_data: api_data }, status: :accepted
    end
    # if query is bad or not present return different status
  end

  

end
