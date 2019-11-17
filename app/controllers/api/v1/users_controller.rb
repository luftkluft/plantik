module Api
  module V1
    class UsersController < ApplicationController
      def profile
        if @current_user.nil?
          render json: { request_message: I18n.t('req_mes.log_in') }, status: 401
        else
          render json: { current_user: UserSerializer.new(@current_user) }, status: 200
        end
      end

      def create
        result = UserService.new.action(@current_user, 'user_create', user_params)
        if result[:errors].empty? && result[:succes].size.positive?
          user = result[:success]
          token = JsonWebToken.encode_payload(user_id: user.id)
          render json: { success_message: I18n.t('suc_mes.user_created_successfully'),
                         user: UserSerializer.new(user),
                         jwt: token }, status: 201
        else
          render json: { error_message: result[:errors] }, status: 412
        end
      end

      private

      def user_params
        params.permit(:username, :email, :password, :password_confirmation, :bio, :avatar)
      end
    end
  end
end
