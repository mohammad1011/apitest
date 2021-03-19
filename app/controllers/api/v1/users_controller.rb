module Api
  module V1
    class UsersController < ApplicationController
        def create
          user = User
          .find_by(email: params["email"])
          .try(:authenticate, params["password"])

          if user
            session[user_id] = user.id
            render json: {status: :created, logged_in: true,
              user: user

            }
          else
            render json: {status: 401}
          end
        end
        def index
          user = User.order('created_at DESC')
          render json: {status: "SUCCESS" , message: "loaded user", data: user}, status: :ok
        end


        def show
          user = User.find(params[:id])
          render json: {status: "SUCCESS" , message: "loaded user", data: user}, status: :ok

        end
        def destroy
          user = User.find(params[:id])
          user.destroy
            render json: {status: "SUCCESS" , message: "Deleted user", data: user}, status: :ok

        end

        private
        def job_params
          params.require(:user).permit(:email, :password)

        end


      end
  end
end
