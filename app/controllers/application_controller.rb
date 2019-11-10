class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authorize_current_user!, except: :create

  private

  def authorize_current_user!
    @current_user = AuthorizeCurrentUser.new(request).call
  end
end
