require 'rails_helper'

RSpec.describe Api::IngredientsController, type: :controller do
    describe 'GET #index' do
        it "responds with all ingredients" do
            get :index, format: :json
        
            parsed_response = JSON.parse(response.body)
            expect(parsed_response.length).to eq(Ingredient.count)
        end
    end
end