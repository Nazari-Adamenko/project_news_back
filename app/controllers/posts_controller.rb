class PostsController < ApplicationController
  before_action :set_post, :authenticate_user!, only: %i[show update destroy]

  # GET /posts
  def index
    posts = if Post.where(is_deleted = false).size == 0
              nil
            else
              Post.where(is_deleted = false).order(created_at: :desc)
            end
    render json: posts.to_json(include: :user)
  end

  # POST /posts
  def create
    post = Post.new(post_params.merge(:user_id => current_user.id))
    if post.save
      render json: serialize(post), status: :created, location: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.permit(:title, :tags, :content, :image)
  end

  def serialize(post)
    post.attributes.merge({ name: post.user.name, image: { url: post.image.url } })
  end
end
