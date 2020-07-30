class Api::RatingsController < ApplicationController
    def index
        ratings = Rating.all
        render json: ratings
    end

    def show
        rating = Rating.find(params[:id])
        render json: rating
    end

    def create
        rating = Rating.create(rating_params)
        render json: rating
    end

    def update
        rating = Rating.find(params[:id])
        rating.update(rating_params)
        render json: rating
    end

    def drinks
        rating = Rating.where(drink_id: params[:drink_id])
        render json: rating
    end

    private 
    
    def rating_params
        params.permit(:score, :user_id, :drink_id, :id)
    end
end 