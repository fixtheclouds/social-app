module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def current_user
      User.first
      # TODO: bring back once authentication is set up
      # context[:current_user]
    end
  end
end
