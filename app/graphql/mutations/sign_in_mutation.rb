module Mutations
  class SignInMutation < BaseMutation
    null true

    argument :credentials, Types::AuthCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by email: credentials[:email]
      return if !user || !user.authenticate(credentials[:password])

      # TODO: handle Remember me
      crypt = ActiveSupport::MessageEncryptor.new(
        Rails.application.credentials.secret_key_base.byteslice(0..31)
      )
      token = crypt.encrypt_and_sign("user-id:#{user.id}")

      { user: user, token: token }
    end
  end
end
