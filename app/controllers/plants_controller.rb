class PlantsController < ApplicationController
  def new
    @plant = Plant.new
    @garden = Garden.find(params[:garden_id])
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.garden = Garden.find(params[:garden_id])
    if @plant.save
      redirect_to garden_path(@plant.garden)
    else
      render :new
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    garden = @plant.garden
    @plant.destroy
    redirect_to garden_path(garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
