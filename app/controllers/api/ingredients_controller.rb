module Api
  class IngredientsController < ApplicationController
    def index
      @ingredients = Ingredient.all
      render json: @ingredients
    end
  end
end