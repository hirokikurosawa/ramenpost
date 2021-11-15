class Users::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.all.page(params[:page]).per(20)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
     if @post.save
      redirect_to user_path(current_user.id)
     else
       flash[:alert] = '画像を選択してください。'
       render action: :new
     end
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
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).per(20)
  end

  def search
    @posts = Post.search(params[:keyword]).page(params[:page]).per(20)
    @keyword = params[:keyword]
  end

  private

  def post_params
    params.require(:post).permit( :post_image, :introduction)
  end
end
