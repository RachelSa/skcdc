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
    #session[:user_id] = @user.id
    redirect_to users_path
   else
    flash[:notice] = "User emails must be unique SKCDC emails. Passwords must be six characters in length."
    render :new
  end
end

  def index
    @classroom_names = Classroom.all.pluck(:name, :id)
    @program_names = Program.all.pluck(:title, :id)
    @contact_names = Contact.all.pluck(:first_name, :last_name, :title, :id)
    @collaboration_titles = Collaboration.all.pluck(:title, :id)
    @posts = Post.all.order('id DESC').limit(5)
  end


  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
