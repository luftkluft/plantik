require_relative '../../../common/constants.rb'

module Api
  module V1
    class AdminController < ActionController::Base
      protect_from_forgery with: :exception
      def index
        redirect_to APP_URL_ADMIN
      end
    end
  end
end
