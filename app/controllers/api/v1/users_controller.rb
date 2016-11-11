module Api
  module V1
    class UsersController < ApplicationController
      include Messages
      def create
        user = User.new(user_params)

        if user.save
          user.generate_token
          render json: user, status: :ok
        else
          render json: { errors: not_created(user) },
                 status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
