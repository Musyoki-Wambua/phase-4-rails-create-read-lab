class PlantsController < ApplicationController
    
    def index 
        render json: Plant.all
    end

    def show 
        plant = Plant.find_by(id: params[:id])
        render json: plant
    end

    def create 
        plant = Plant.create(params.permit(:name, :image, :price))
        if plant 
            render json: plant, status: :created
        else
            render json: {error: "Error occurred while creating a Plant"}, status: :not_found
        end
    end
end
