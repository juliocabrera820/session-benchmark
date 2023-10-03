require 'jwt'

module Authentication
  class JwtService
    def self.encode(payload, exp = Time.now + (7 * 24 * 60 * 60))
      payload[:exp] = exp.to_i
      JWT.encode(payload, Hanami.app["settings"].jwt_secret_key, 'HS256')
    end

    def self.decode(token)
      JWT.decode(token, Hanami.app["settings"].jwt_secret_key, true, algorithm: 'HS256')
    end
  end
end
