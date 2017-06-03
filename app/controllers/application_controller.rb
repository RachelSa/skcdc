class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def authenticate_user
    redirect_to login_path unless logged_in?
  end
end
