require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let(:user){FactoryBot.create(:user, email: 'test2@email.com' )}
    it  'authenticate the client' do
      post '/api/v1/authenticate', params: {email: user.email ,password: 'mypass' }

      expect(response).to have_http_status(:created)

    end
    it 'returns error when email is missing' do
      post '/api/v1/authenticate', params: {password: 'mypass' }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when password is missing' do
    post '/api/v1/authenticate', params: {email: 'test1@email.com' }

    expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
