module Session
  module Actions
    module Users
      class Index < Session::Action
        include Deps["persistence.rom"]

        def handle(*, response)
          users = rom.relations[:users]
            .select(:email, :password)
            .order(:email)
            .to_a

          response.format = :json
          response.body = users.to_json
        end
      end
    end
  end
end
