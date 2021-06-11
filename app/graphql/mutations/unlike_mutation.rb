module Mutations
  class UnlikeMutation < BaseMutation
    field :likes_count, Integer, null: true
    field :errors, [String], null: true

    argument :likeable_id, ID, required: true
    argument :likeable_type, String, required: true

    def resolve(likeable_id:, likeable_type:)
      case likeable_type
      when 'post'
        if ability.can?(:destroy, Like)
          post = Post.find_by(id: likeable_id)
          return { errors: 'No post found' } unless post.present?
          return { errors: 'Like not set' } unless post.likes.where(user: current_user).exists?

          like = post.likes.find_by(user: current_user).destroy
          { likes_count: post.likes.reload.count }
        else
          { errors: 'Not authorized' }
        end
      else
        { errors: 'Likes for this type are not allowed' }
      end
    end
  end
end
