class JwtAuthService
  HMAC_SECRET = Rails.application.credentials[Rails.env.to_sym][:jwt][:secret]

  def initialize(token)
    @token = token
  end

  def encode
    payload = { data: 'work' }
    token = JWT.encode payload, HMAC_SECRET, 'HS256'
  end

  def decode
    decoded_token = JWT.decode @token, HMAC_SECRET, true, { algorithm: 'HS256' }
  end
end

