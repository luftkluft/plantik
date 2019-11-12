class UserService
  def initialize
    @result = { success: [], errors: [] }
  end

  def action(current_user, type, user_params)
    @result[:errors] = ValidatorService.new.user_validator(current_user, type, user_params)
    return @result unless @result[:errors].empty?

    case type # TODO: action list and i18n
    when 'user_create'
      user_create(user_params)
    end
    @result
  end

  private

  def user_create(user_params)
    user = User.create!(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )
    @result[:success].push(user)
  rescue StandardError
    @result[:errors].push('ошибка создания юзера')
  end
end
