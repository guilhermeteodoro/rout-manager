require 'rails_helper'

describe MapsController do
  describe '#create' do
    it 'completes with name and routes' do
      post :create, name: build(:map).name, routes: attributes_for_list(:route, 10)
      expect(response).to have_http_status(:created)
    end

    it 'completes with only name' do
      post :create, name: build(:map).name
      expect(response).to have_http_status(:created)
    end
  end

  describe '#determine' do
  end
end
