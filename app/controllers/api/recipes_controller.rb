module Api
  class RecipesController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
      @recipes = Recipe.all
      render json: @recipes
    end

    def create 
        @recipe = Recipe.filter_recipes(params[:_json])
        render json: @recipe
    end
  end
end
