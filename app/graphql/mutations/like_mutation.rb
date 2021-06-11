module Mutations
  class LikeMutation < BaseMutation
    field :likes_count, Integer, null: true
    field :errors, [String], null: true

    argument :likeable_id, ID, required: true
    argument :likeable_type, String, required: true

    def resolve(likeable_id:, likeable_type:)
      case likeable_type
      when 'Post'
        if ability.can?(:create, Like)
          post = Post.find_by(id: likeable_id)
          return { errors: 'No post found' } unless post.present?
          return { errors: 'Already set' } if post.likes.where(user: current_user).exists?

          like = post.likes.create(user: current_user)
          { likes_count: post.likes.count }
        else
          { errors: 'Not authorized' }
        end
      else
        { errors: 'Likes for this type are not allowed' }
      end
    end
  end
end
