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

    # Calculated
    field :image_url, String, null: true
    field :liked, Boolean, null: true
    field :likes_count, Int, null: true

    def image_url
      return nil if object.image.blank?

      Rails.application.routes.url_helpers.rails_blob_url(object.image)
    end

    def liked
      return false unless current_user

      object.likes.where(user_id: current_user.id).exists?
    end

    def likes_count
      object.likes.count
    end
  end
end
