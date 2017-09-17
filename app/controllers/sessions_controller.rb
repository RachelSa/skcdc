class SessionsController < ApplicationController

  def new
    @admin = Contact.find_by(title: "Information Systems Manager")
  end

  def create
   if !User.find_by(email: params[:user][:email].downcase).try(:authenticate, params[:user][:password])
     flash[:notice] = "invalid login credentials"
     @admin = Contact.find_by(title: "Information Systems Manager")
     render :new
   else
     @user = User.find_by(email: params[:user][:email].downcase)
     session[:user_id] = @user.id
     flash[:notice] = "successful login"
     redirect_to admin_path
   end
 end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to login_path
  end

private

  def session_params
    params.require(:user).permit(:email)
  end

end
