class Api::V1::UserPlantsController < ApplicationController
  before_action :find_user_plant, only: [:update, :destroy]

  def create
    @user_plant = UserPlant.create(user_plant_params)
    if @user_plant.valid?
      render json: { user_plant: UserPlantSerializer.new(@user_plant) }, status: :created
    else
      render json: { error: 'failed to create user_plant' }, status: :not_acceptable
    end
  end

  def update
    @user_plant.update(user_plant_params)
    render json: { user_plant: UserPlantSerializer.new(user_plant) }, status: :ok
  end

  def destroy
    @user_plant.delete
    render json: {}, status: :accepted
  end

  private

  def user_plant_params
    params.require(:user_plant).permit(:user_id, :plant_id, :nickname)
  end

  def find_user_plant
    @user_plant = UserPlant.find(params[:id])
  end

end
