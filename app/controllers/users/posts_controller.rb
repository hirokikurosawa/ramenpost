class Users::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).limit(50)
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
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc).page(params[:page]).per(20)
  end

  def search
    @posts = Post.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(20)
    @keyword = params[:keyword]
  end

  private

  def post_params
    params.require(:post).permit( :post_image, :introduction)
  end
end
