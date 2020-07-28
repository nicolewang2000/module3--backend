class Api::IngredientsController < ApplicationController
    def index
      ingredients = Ingredient.all
      render json: ingredients
    end

    def show
      ingredient = Ingredient.find(params[:id])
      render json: ingredient
    end

    def create
      ingredient = Ingredient.create(ingredient_params)
      render json: ingredient
    end

    private

    def ingredient_params
      params.permit(:name)
    end
  end