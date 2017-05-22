class SessionsController < ApplicationController

  def new

  end

  def create
   if !User.find_by(email: params[:user][:email].downcase).try(:authenticate, params[:user][:password])
     flash.now.alert = "invalid login credentials"
     redirect_to "/login"
   else
     @user = User.find_by(email: params[:user][:email].downcase)
     session[:user_id] = @user.id
     redirect_to users_path
   end
 end

private

  def session_params
    params.require(:user).permit(:email)
  end

end