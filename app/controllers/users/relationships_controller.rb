class Users::RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    following.save
    redirect_to user_path(@user)
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end

end
