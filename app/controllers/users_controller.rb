class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :check_super

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  @user.email.downcase!
  if @user.save
    flash[:notice] = "user created"
    redirect_to admin_path
   else
    flash.now[:notice] = "User emails must be unique SKCDC emails. Passwords must be six characters in length."
    render :new
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    if User.super_count >= 1
      flash[:notice] = "user updated"
      redirect_to super_admin_path
    else
      @user.update(super: 'true')
      @user.errors.add(:super, "there must be at least 1 super admin")
      @errors = @user.errors.messages
      flash[:notice] = @errors
      render :edit
    end
  else
    @errors = @user.errors.messages
    flash[:notice] = @errors
    render :edit
  end
end

def super
  current_user
  @users = User.order(:email)
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to super_admin_path, :notice => "user deleted"
end



#delete user

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :super)
    end
end
