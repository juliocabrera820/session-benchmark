# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :anonymous_users do
      add_foreign_key :user_id, :users, on_delete: :cascade
    end
  end
end
