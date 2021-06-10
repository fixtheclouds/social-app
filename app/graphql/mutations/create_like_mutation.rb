module Mutations
  class CreateLikeMutation < BaseMutation
    field :like, Types::LikeType, null: true
    field :errors, [String], null: true

    argument :likeable_id, ID, required: true
    argument :likeable_type, String, required: true

    def resolve(likeable_id:, likeable_type:)
      case likeable_type
      when 'post'
        if ability.can?(:create, Like)
          post = Post.find_by(id: likeable_id)
          if post.present?
            like = post.likes.create(user: current_user)
            { like: like }
          else
            { errors: 'No post found' }
          end
        else
          { errors: 'Not authorized' }
        end
      else
        raise NotImplementedError, 'Likes for this type are not allowed'
      end
    end
  end
end
