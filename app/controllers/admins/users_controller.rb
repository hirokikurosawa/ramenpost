class Admins::UsersController < ApplicationController
  def index
    @users = User.all
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
    redirect_to admins_user(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :nickname, :icon, :introduction)
  end
end
