require_relative '../../../lib/authentication/jwt_service'

module Session
  module Actions
    module Users
      class Show < Session::Action
        include Deps["persistence.rom"]

        def handle(request, response)
          if request.params.valid?
            user_params =  { email: "email-#{rand(100000000)}@example", password: "password" }
            user = rom.relations[:users].changeset(:create, user_params).commit
            anonymous_user_params = { name: "anonymous user #{user[:id]}", user_id: user[:id] }
            anonymous_user = rom.relations[:anonymous_users].changeset(:create, anonymous_user_params).commit
            payload = { user_id: user[:id] }
            token = Authentication::JwtService.encode(payload)
            response.status = 201
            session_response = { user: anonymous_user, auth_token: token }
            response.body = session_response.to_json
          else
            response.status = 422
            response.format = :json
            response.body = { message: 'error' }
          end
        end
      end
    end
  end
end
