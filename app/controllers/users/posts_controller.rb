class Users::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to user_path(current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  def following_posts
  end

  def search
  end

  private

  def post_params
    params.require(:post).permit( :post_image, :introduction)
  end
end
