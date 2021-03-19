require 'rails_helper'

describe 'Jobs API', type: :request do
    describe 'GET /jobs'do
    before do
      FactoryBot.create(:job, title: "test rspec", body: "test body om rspec" )
      FactoryBot.create(:job, title: "test2 rspec", body: "test2 body om rspec")
    end

    it 'returns all jobs' do
      get '/api/v1/jobs'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /jobs' do
      it 'create a new job ' do
        expect{
        post '/api/v1/jobs', params: {
          job: {title: "test rspec", body: "test body om rspec"},
          user: {email: "test@email.com" , password: "mypass"}
        }
      }.to change {Job.count}.from(0).to(1)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to eq(
            {
            'id' => 1,
            'title' => 'test rspec',
            'email' => 'test@email.com'
            }
        )
      end
  end

  describe 'DELETE /jobs/:id' do
  let!(:job) {FactoryBot.create(:job, title: "test rspec", body: "test body om rspec")}

    it 'deletes a job ' do
      expect{
      delete "/api/v1/jobs/#{job.id}"
    }.to change {Job.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end

end
