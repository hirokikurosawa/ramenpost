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
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  def following_posts
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
  end

  private

  def post_params
    params.require(:post).permit( :post_image, :introduction)
  end
end
