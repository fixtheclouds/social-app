module Mutations
  class CreateLike < BaseMutation
    field :like, Types::LikeType, null: false

    argument :likeable_id, ID, required: true
    argument :likeable_type, String, required: true

    # TODO: define resolve method
    def resolve(likeable_id:, likeable_type:)
      case likeable_type
      when 'post'
        Post.create_like(user: context[:current_user])
      else
        raise NotImplementedError, 'Likes for this type are not allowed'
      end
    end
  end
end
