module Mutations
  class CreateLike < BaseMutation
    field :like, Types::LikeType, null: false

    argument :likeable_id, ID, required: true
    argument :likeable_type, String, required: true

    def resolve(likeable_id:, likeable_type:)
      case likeable_type
      when 'post'
        # TODO: make cancancan work first
        # if can?(:create, Like)
        if current_user
          Post.likes.create(user: context[:current_user])
        else
          render nothing: true, status: 403
        end
      else
        raise NotImplementedError, 'Likes for this type are not allowed'
      end
    end
  end
end
