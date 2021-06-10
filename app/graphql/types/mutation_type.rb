module Types
  class MutationType < Types::BaseObject
    field :like, mutation: Mutations::LikeMutation
    field :unlike, mutation: Mutations::UnlikeMutation
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
