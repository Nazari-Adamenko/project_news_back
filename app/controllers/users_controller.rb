class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def show
    render json: @user.to_json(include: :posts)
  end

  # PATCH/ /user/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
