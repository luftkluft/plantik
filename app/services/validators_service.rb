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

    @errors.push(I18n.t('err_mes.forbidden')) unless current_user.nil?
    @errors.push(I18n.t('req_mes.log_in')) if current_user.nil?
  end

  def action_validator(action)
    # TODO: dev
  end

  def params_validator(action, params)
    # TODO: dev
  end
end
