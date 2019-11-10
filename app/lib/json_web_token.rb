class JsonWebToken
  attr_reader :token
  SECRET = Rails.application.secrets.devise_secret_key || ENV['DEVISE_SECRET_KEY']
  def self.encode_payload(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET)
  end

  def self.decode_request(request)
    return nil if request.headers['Authorization'].nil?

    @token = request.headers['Authorization'].split(' ')[1]
    begin
      JWT.decode(@token, SECRET, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end
end
