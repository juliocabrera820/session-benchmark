module Session
  module Actions
    module Users
      class Create < Session::Action
        include Deps["persistence.rom"]

        params do
          required(:user).hash do
            required(:email).filled(:string)
            required(:password).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            user = rom.relations[:users].changeset(:create, request.params[:user]).commit

            response.status = 201
            response.body = user.to_json
          else
            response.status = 422
            response.format = :json
            response.body = request.params.errors.to_json
          end
        end
      end
    end
  end
end
