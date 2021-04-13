module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :full_name, String, null: false
    field :last_sign_in_at, GraphQL::Types::ISO8601DateTime, null: true
    field :avatar_url, String, null: true

    def avatar_url
      return nil if object.avatar.blank?

      Rails.application.routes.url_helpers.rails_blob_url(object.avatar)
    end
  end
end
