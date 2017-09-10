class ClassroomsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      redirect_to admin_path, :notice => "#{@classroom.name} created"
    else
      flash[:notice] = "Classrooms must have a name"
      render :new
    end
  end

  def index
    @classrooms = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
    @map_url = "https://www.google.com/maps/search/?api=1&query=+#{@classroom.url_street_address}"
  end

  def edit
    @classroom = Classroom.find(params[:id])
    @programs = Program.all
  end

  def update
    @classroom = Classroom.find(params[:id])
    if @classroom.update(classroom_params)
      redirect_to admin_path, :notice => "#{@classroom.name} updated"
    else
      @programs = Program.all
      flash[:notice] = "Classrooms must have a name. Attached images must be less than 1 MB"
      render :edit
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to admin_path, :notice => "Classroom deleted"
  end

  def admin
    @classroom_names = Classroom.all.pluck(:name, :id)
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :street_address, :town, :zipcode, :image, :description, :phone, {:program_ids => []})
  end

end
