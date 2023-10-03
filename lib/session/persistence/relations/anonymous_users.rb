module Session
  module Persistence
    module Relations
      class AnonymousUsers < ROM::Relation[:sql]
        schema(:anonymous_users, infer: true)
      end
    end
  end
end
