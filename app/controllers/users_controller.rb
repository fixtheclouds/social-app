class UsersController < ApplicationController
  before_action :authorized, only: [:auto_sign_in]

  def create
    @current_user = User.create(user_params)
    if current_user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: current_user, token: token}
    else
      render json: { error: "Invalid username or password" }
    end
  end

  def sign_in
    @current_user = User.find_by(username: params[:username])

    if current_user && current_user.authenticate(params[:password])
      token = encode_token({ user_id: current_user.id })
      render json: { user: current_user, token: token }
    else
      render json: { error: "Invalid username or password" }
    end
  end


  def auto_sign_in
    render json: current_user
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
