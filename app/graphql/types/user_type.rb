module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :full_name, String, null: false
    field :last_sign_in_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
