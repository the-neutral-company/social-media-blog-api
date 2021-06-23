class UsersController < ApplicationController
  def register
    user = User.new(user_params)

    if user.valid? && user.save
      render json: user, status: 201
    else
      render json: user.errors, status: 400
    end
  end

  def login
    user = User.find_by(email: params[:user][:email])

    unless user&.valid_password?(params[:user][:password])
      render json: {
        status: 'error',
        message: 'Invalid credentials'
      }, status: 300 and return
    end

    render json: user, status: 200
  end

  private

  def user_params
    params.require(:user).permit(%i[email password password_confirmation])
  end
end
