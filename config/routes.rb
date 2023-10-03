# frozen_string_literal: true

module Session
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }
    get "/users", to: "users.index"
    post "/users", to: "users.create"
    get "/users/profile", to: "users.show"
  end
end
