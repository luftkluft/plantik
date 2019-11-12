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
        result = UserService.new.action(@current_user, 'user_create', user_params)
        if result[:errors].empty? && result[:succes].size.positive?
          user = result[:success]
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
