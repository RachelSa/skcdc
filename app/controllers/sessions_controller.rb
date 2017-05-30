class SessionsController < ApplicationController

  def new

  end

  def create
   if !User.find_by(email: params[:user][:email].downcase).try(:authenticate, params[:user][:password])
     flash[:notice] = "invalid login credentials"
     render :new
   else
     @user = User.find_by(email: params[:user][:email].downcase)
     session[:user_id] = @user.id
     flash[:notice] = "successful login"
     redirect_to users_path
   end
 end

private

  def session_params
    params.require(:user).permit(:email)
  end

end
