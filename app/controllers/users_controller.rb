class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def show
    render json: @user.to_json(include: :posts)
  end

  def get_user_posts
    render json: current_user.post
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
