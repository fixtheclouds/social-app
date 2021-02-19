module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :body, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Relations
    field :user, Types::UserType, null: false
    field :parent, Types::PostType, null: true
    field :comments, [Types::CommentType], null: true
  end
end