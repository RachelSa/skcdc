class UsersController < ApplicationController
  before_action :authenticate_user
  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  @user.email.downcase!
  if @user.save
    flash[:notice] = "user created"
    session[:user_id] = @user.id
    redirect_to admin_path
   else
    flash[:notice] = "User emails must be unique SKCDC emails. Passwords must be six characters in length."
    render :new
  end
end

#delete user

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
