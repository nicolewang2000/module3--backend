class Api::DrinkIngredientsController < ApplicationController
    def index
      dis = DrinkIngredient.all
      render json: dis
      # render json: dis.to_json(:include => {
      #   :ingredient => {:only => [:name]},
      #   :drink => {:only => [:name]}
      # })
    end

    def show
        di = DrinkIngredient.find(params[:id])
        render json: di
        # render json: di.to_json(:include => {
        #   :ingredient => {:only => [:name]},
        #   :drink => {:only => [:name]}
        # })
    end

    def create
      di = DrinkIngredient.create(drink_ingredient_params)
      render json: di
    end

    private

    def drink_ingredient_params
      params.permit(:measurement, :drink_id, :ingredient_id)
    end
    
  end