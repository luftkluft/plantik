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
        # user = User.create(user_params)
        # if user.valid?
        #   token = JsonWebToken.encode_payload(user_id: user.id)
        #   render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        # else
        #   render json: { error: 'failed to create user' }, status: :not_acceptable
        # end
        puts '=====def create user======'
        # puts user_params
        # puts '***'
        # puts user_params.inspect
        # puts '***'
        # puts user_params[:password]
        # puts User.make_encrypted_password(user_params[:password])
        # puts '***'
        # user = User.new(email: user_params[:email],
        #                 encrypted_password: User.make_encrypted_password(user_params[:password]))
        # user = User.new(email: 'user2@email.com', encrypted_password: '$2a$12$cMmiOJQYVw/iecq0P3v2WOk/EyV29hkOcaXkzjH6IyFbbPYAiC29q')
        # user = User.create!(email: 'userr@email.com', password: 'password', password_confirmation: 'password')
        # user = User.new(email: 'userr@email.com', password: 'password', password_confirmation: 'password')
        # user.email = 'user3@email.com'

        # user = AdminUser.create!(
        #   email: 'admin2@example.com',
        #   password: 'password',
        #   password_confirmation: 'password'
        # )
        user = User.create!(
          email: 'user3@example.com',
          password: 'password',
          password_confirmation: 'password'
        )

        puts user.inspect
        # puts user.valid?
        puts user.errors.size
        puts '$$$$$'
        if user.valid?
          token = JsonWebToken.encode_payload(user_id: user.id)
          render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

      private

      def user_params
        params.permit(:username, :email, :password, :bio, :avatar)
      end
    end
  end
end
