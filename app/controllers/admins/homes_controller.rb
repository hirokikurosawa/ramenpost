class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = Post.all.order(created_at: :desc).page(params[:page]).limit(50)
  end
end
