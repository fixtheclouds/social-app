module Types
  class MutationType < Types::BaseObject
    field :create_like, mutation: Mutations::CreateLikeMutation
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
