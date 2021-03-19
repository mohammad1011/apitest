module Api
  module V1
      class JobsController < ApplicationController
            def index
              jobs = Job.all
              render json: JobsRepresenter.new(jobs).as_json
            end

            def create
                user = User.create!(user_params)
                job = Job.new(job_params.merge(user_id: user.id))

                if job.save
                  render json: BookRepresenter.new(job).as_json, status: :created
                else
                  render json: job.errors, status: :unprocessable_entity
                end
            end

            def show
              job = Job.find(params[:id])
              render json: {status: "SUCCESS" , message: "loaded job", data: job}, status: :ok

            end
            def destroy

            Job.find(params[:id]).destroy!
            head :no_content
            end

            private
            def user_params
              params.require(:user).permit(:email)
            end
            def job_params
              params.require(:job).permit(:title, :body)

            end
      end
  end
end
