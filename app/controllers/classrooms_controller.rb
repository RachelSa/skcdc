class ClassroomsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      redirect_to admin_path, :notice => "Success! Visit <a href='#{classroom_path(@classroom)}'>published classroom</a>."
    else
      @errors = @classroom.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def index
    @classrooms = Classroom.order(:name)
    @recent_posts = Post.all.order('id DESC').limit(5)
  end

  def show
    @classroom = Classroom.find_by(id: params[:id])
    if @classroom
      @map_url = "https://www.google.com/maps/search/?api=1&query=+#{@classroom.url_street_address}"
    else
      redirect_to classrooms_path
    end
  end

  def edit
    @classroom = Classroom.find(params[:id])
    @programs = Program.all
  end

  def update
    @classroom = Classroom.find(params[:id])
    if @classroom.update(classroom_params)
      redirect_to admin_path, :notice => "Success! Visit <a href='#{classroom_path(@classroom)}'>updated classroom</a>."
    else
      @programs = Program.all
      @errors = @classroom.errors.messages
      flash[:notice] = @errors
      render :edit
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to admin_path, :notice => "Classroom deleted"
  end

  def admin
    @classroom_names = Classroom.order(:name).pluck(:name, :id)
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :street_address, :town, :zipcode, :image, :description, :phone, {:program_ids => []})
  end

end
