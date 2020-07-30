class Api::DrinksController < ApplicationController
    def index
      drinks = Drink.all
      render json: drinks
    end

    def show
      drink = Drink.find(params[:id])
      render json: drink
    end

    def create
      drink = Drink.create(drink_params)
      render json: drink
    end

    def update
      drink = Drink.find(params[:id])
      drink.update(drink_params)
      render json: drink
    end

    def destroy 
      drink = Drink.find(params[:id])
      drink.destroy
      render json: "Deleted"
    end
    
    private

    def drink_params
      params.permit(:name, :direction, :image, :glass, :alcoholic, :user_id, ingredient_attributes: [:name])
    end
  end

 # render json: drinks.to_json(:include => {
      #   :drink_ingredients => {:only => [:measurement]}, 
      #   :ingredients => {:only => [:name]},
      #   :ratings => {:only => [:score, :user_id]}
      # })

# render json: drink.to_json(:include => {
      #   :drink_ingredients => {:only => [:measurement]}, 
      #   :ingredients=> {:only => [:name]},
      #   :ratings => {:only => [:score, :user_id]}
      # })