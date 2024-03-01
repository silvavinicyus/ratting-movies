class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @token = encode_token(user_id: @user.id)
      render json: {
        user: {
          email: @user.email,
          username: @user.username
        },
        token: @token
      }, status: :accepted
    else
      render json: {message: "Incorrect email or password!"}, status: :unauthorized
    end
  end

  def destroy
  end
end