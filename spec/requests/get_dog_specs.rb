require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Dogs', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:dog, 10)
      get '/api/v1/dogs'
    end

    it 'returns all posts' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
