class PlantsController < ApplicationController

    #GET /plants
    def index
        plants = Plant.all
        render json: plants, except: [:created_at, :updated_at]
    end

    # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, except: [:created_at, :updated_at], status: :created
  end

    #GET /plants/:id
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
        render json: plant, except: [:created_at, :updated_at]
        else
        render json: { error: "Plant not found" }, status: :not_found
        end
    end

    private
  # all methods below here are private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
