# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :email, :text, null: false
      column :password, :text, null: false
    end
  end
end
