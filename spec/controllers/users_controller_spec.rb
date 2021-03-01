require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  before(:all) do
    User.destroy_all
    Link.destroy_all
  end
  describe "GET #index" do
    it 'successful index page' do
      get :index, as: :json
      expect(response).to be_successful
    end
  end
  describe 'GET #show' do
    it 'successful show page' do
      create(:user)
      get :index, params: {id: 1}, as: :json
      expect(response).to be_successful
    end
  end
  describe 'POST #create' do
    it 'creates a user' do
      post :create, params: {name: Faker::Movies::HitchhikersGuideToTheGalaxy.character}
      expect(response).to be_successful
    end
  end
end