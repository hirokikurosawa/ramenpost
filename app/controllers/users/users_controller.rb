class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(18)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def check
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_path
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings.order(created_at: :desc)
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.order(created_at: :desc)
  end

  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @posts = Kaminari.paginate_array(Post.find(likes)).page(params[:page]).per(18)
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :profile_image, :introduction)
  end

end
