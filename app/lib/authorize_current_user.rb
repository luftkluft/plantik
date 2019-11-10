require 'json_web_token.rb'

class AuthorizeCurrentUser
  def initialize(request = {})
    @request = request
    @current_user = nil
  end

  def call
    authorized
  end

  private

  def authorized
    return nil unless logged_in?

    @current_user
  end

  def logged_in?
    !!current_user
  end

  def current_user
    user_id = JsonWebToken.decode_request(@request)
    return nil unless !!user_id

    user_id = user_id[0]['user_id']
    @current_user = User.find_by(id: user_id)
  end
end
