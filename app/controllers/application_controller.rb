class ApplicationController < ActionController::API
  before_action :authorized

  attr_reader :current_user

  def encode_token(payload)
    JWT.encode(payload, auth_secret)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, auth_secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    logged_in_user.present?
  end

  def authorized
    logged_in?
    # Do not block guests now
    # render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  protected

  def auth_secret
    Rails.application.secrets.secret_key_base
  end
end
