module Api
  module V1
    class AuthenticationController < ApplicationController
      def authenticate
        case current_user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
        when nil then render json: { error_message: I18n.t('err_mes.wrong_login_or_password') }, status: 401
        else
          render json: { jwt: JsonWebToken.encode_payload(user_id: current_user.id) }, status: 200
        end
      end

      private

      def auth_params
        params.permit(:email, :password)
      end
    end
  end
end
