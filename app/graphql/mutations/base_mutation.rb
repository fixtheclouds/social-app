module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def current_user
      User.first
      # TODO: bring back once authentication is set up
      # context[:current_user]
    end
  end
end
