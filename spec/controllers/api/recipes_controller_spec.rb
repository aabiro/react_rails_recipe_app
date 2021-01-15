require 'rails_helper'

RSpec.describe Api::RecipesController, type: :controller do
  describe 'GET #index' do
    it "responds with all recipes" do
      get :index, format: :json

      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(Recipe.count)
    end
  end

  describe 'POST #create' do
    let(:_json1) { { } } # Would like to implement Factory to mimic values
    let(:_json2) { { '_json' => [1,2,4] } }
    let(:_json3) { { '_json' => [11] } } # 0nly Lettuce Wrap has mandarin as of now

    it "responds with no recipes when no ingredients" do
      post :create, format: :json, params: _json1

      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to eq(nil)
    end

    it "responds with correct number recipes" do
      post :create, format: :json, params: _json2

      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(2)
    end

    it "responds with correct recipe from ingredient" do
      post :create, format: :json, params: _json3
      
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.first["name"]).to eq("Lettuce Wrap")
    end
  end
end
