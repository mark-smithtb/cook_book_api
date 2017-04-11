class AuthToken
  # Encode a hash in a json web token
  def self.encode(payload, expiration = 1.month.from_now)
    payload = payload.dup
    payload[:exp] = expiration.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # Decode a token and return the payload inside
  # It will throw an error if expired or invalid. See the docs for the JWT gem.
  def self.decode(token, leeway = nil)
    JWT.decode(token, Rails.application.secrets.secret_key_base, leeway: leeway).first
  end
end
