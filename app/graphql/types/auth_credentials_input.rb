module Types
  class AuthCredentialsInput < BaseInputObject
    graphql_name 'AUTH_CREDENTIALS'

    argument :email, String, required: true
    argument :password, String, required: true

    argument :remember_me, Boolean, required: false
  end
end
