class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def check
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_path
    #@user = User.find(current_user.id)
    #@user.update(is_active: false)
    #reset_session
    #redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name, :nickname, :icon, :introduction)
  end
end
