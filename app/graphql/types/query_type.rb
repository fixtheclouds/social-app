module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, [Types::PostType], null: false, description: 'List all posts'
    field :post, Types::PostType, null: false, description: 'Retrieve a post' do
      argument :id, type: Integer, required: true
    end

    def posts
      Post.all.includes(:user, :likes, :comments)
    end

    def post(id:)
      Post.find_by(id: id)
    end
  end
end
