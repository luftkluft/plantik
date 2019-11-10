module Api
  module V1
    class AuthenticationController < ApplicationController
      def authenticate
        case current_user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
        when nil then render json: { message: 'unidentified user' }, status: :ok
        else
          render json: { jwt: JsonWebToken.encode_payload(user_id: current_user.id) }, status: :ok
        end
      end

      private

      def auth_params
        params.permit(:email, :password)
      end
    end
  end
end
