class Api::DrinksController < ApplicationController
    def index
      drinks = Drink.all
      render json: drinks.to_json(:include => {
        :drink_ingredients => {:only => [:measurement]}, 
        :ingredients => {:only => [:name]},
        :ratings => {:only => [:score, :user_id]}
      })
    end

    def show
      drink = Drink.find(params[:id])
      options = {
        include: [:ingredients, :drink_ingredients]
      }
      render json: drink.to_json(:include => {
        :drink_ingredients => {:only => [:measurement]}, 
        :ingredients=> {:only => [:name]},
        :ratings => {:only => [:score, :user_id]}
      })
    end
  end