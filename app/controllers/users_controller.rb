class UsersController < ApplicationController
  before_action :authorized, only: [:auto_sign_in]

  attr_reader :user

  def create
    @user = User.create(user_params)
    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: @user, token: token}
    else
      render json: { error: "Invalid username or password" }
    end
  end

  def sign_in
    @user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "Invalid username or password" }
    end
  end


  def auto_sign_in
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
