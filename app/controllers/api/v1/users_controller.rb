module Api
  module V1
    class UsersController < ApplicationController
      def profile
        if @current_user.nil?
          render json: { message: 'Please log in' }, status: :unauthorized
        else
          render json: { user: UserSerializer.new(@current_user) }, status: :accepted
        end
      end

      def create
        # TODO: move to users service
        user = User.new(
          email: user_params[:email],
          password: user_params[:password],
          password_confirmation: user_params[:password_confirmation]
        )

        if user.save
          token = JsonWebToken.encode_payload(user_id: user.id)
          render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

      private

      def user_params
        params.permit(:username, :email, :password, :password_confirmation, :bio, :avatar)
      end
    end
  end
end
