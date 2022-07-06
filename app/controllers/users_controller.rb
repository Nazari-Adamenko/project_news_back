class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def show
    render json: @user.to_json(include: :posts)
  end

  # PATCH/ /user/1
  def update
    if @user.update(user_params)
      render json: @user.to_json(include: :posts)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :avatar)
  end
end
