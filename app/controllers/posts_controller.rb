class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.where('is_deleted = false')

    render json: @posts
  end


  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :tags, :user_id, :image, :is_delited, :content)
    end
end
