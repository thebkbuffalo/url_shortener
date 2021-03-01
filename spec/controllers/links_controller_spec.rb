require 'rails_helper'

RSpec.describe Api::V1::LinksController do
  describe 'GET #index' do
    it 'successful index page' do
      get :index, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'show redirect for html and matching links for json' do
      create(:user)
      link = create(:link)
      link.generate_short_url
      get :show, params: {slug: link.slug}
      expect(response.status).to eq(302)
      get :show, params: {slug: link.slug}, as: :json
      if response.body
        response_link = JSON.parse(response.body)
        expect(response_link['link']['id']).to eq(link.id)
      end
    end
  end

  describe 'POST #create' do
    it 'creates a link without a set slug' do
      user = create(:user)
      post :create, params: {user_id: user.id, url: 'https://google.com'}, as: :json
      expect(response).to be_successful
    end
    it 'creates a link with a set slug' do
      user = create(:user)
      slug = 'google' + (1..100).to_a.sample.to_s
      post :create, params: {user_id: user.id, url: 'https://google.com', slug: slug}, as: :json
      expect(response).to be_successful
      rp = JSON.parse(response.body)
      expect(rp['new_link']['slug']).to eq(slug)
    end
  end

  describe 'delete #destroy' do
    it 'can delete a link' do
      create(:user)
      create(:link)
      link_count = Link.all.count
      delete :destroy, params: {id: Link.last.id}, as: :json
      expect(response).to be_successful
      expect(link_count).not_to be(Link.all.count)
    end
  end
end