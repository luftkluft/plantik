class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    current_user
  end

  private

  def current_user
    return nil unless !!@email && !!@password

    current_user = User.find_by(email: @email)
    return nil if current_user.nil?

    return current_user if current_user.authenticate(@password)
  end
end
