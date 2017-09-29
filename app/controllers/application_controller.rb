class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id])
  end

  def authenticate_user
    redirect_to login_path unless logged_in?
  end

  def super_admin?
    current_user.super
  end

  def check_super
    redirect_to admin_path unless super_admin?
  end
end
