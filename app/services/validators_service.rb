VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze # TODO: common constant

class ValidatorService
  def initialize
    @errors = []
  end

  def user_validator(current_user, action, params)
    # TODO: i18n
    current_user_validator(current_user)
    action_validator(action)
    params_validator(action, params)
  end

  private

  def current_user_validator(current_user, action)
    return if action == 'user_create' && current_user.nil?

    @errors.push('несанкционированный доступ') unless current_user.nil?
    @errors.push('залогинтесь') if current_user.nil?
  end

  def action_validator(action)
    # TODO: now in developing
  end

  def params_validator(action, params)
    # TODO: now in developing
  end
end
