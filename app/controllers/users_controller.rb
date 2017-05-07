class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
  @user.email.downcase!
  if @user.save
    #session[:user_id] = @user.id
    redirect_to users_path
   else
    render :new
  end
end

  def index
    @classroom_names = Classroom.all.pluck(:name, :id)
    @program_names = Program.all.pluck(:title, :id)
    @contact_names = Contact.all.pluck(:first_name, :last_name, :title, :id)
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
