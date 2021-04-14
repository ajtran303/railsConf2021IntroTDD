class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to "/users", alert: ["Success!"]
    else
      redirect_to "/users", alert: user.errors.full_messages
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email)
  end
end
