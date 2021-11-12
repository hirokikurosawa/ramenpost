class Admins::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(30)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to admins_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :nickname, :icon, :introduction)
  end
end
