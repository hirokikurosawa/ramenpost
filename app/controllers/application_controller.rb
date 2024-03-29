class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    following_posts_posts_path
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_path
    when User
      following_posts_posts_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :profile_image])
  end
end
