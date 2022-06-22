class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    Post.where(is_deleted = false).size() == 0 ?
    posts = ConstantMessage::NOT_POSTS : 
    posts = Post.where(is_deleted = false).order(created_at: :desc)
    render json: posts.to_json(include: :user)
  end

  # POST /posts
  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: :created, location: post
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
      params.require(:post).permit(:title, :tags, :user_id, :image, :is_delited, :content, :user_name)
    end
end
