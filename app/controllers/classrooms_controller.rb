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
    @map_url = "https://maps.googleapis.com/maps/api/staticmap?center=#{@classroom.latitude},#{@classroom.longitude}&zoom=15&size=400x400&markers=color:red%7C#{@classroom.google_address}&key=#{ENV["google_key"]}"
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
      flash[:notice] = "Classrooms must have a name"
      @programs = Program.all
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
    params.require(:classroom).permit(:name, :location, :map_url, :image_url, :description, :longitude, :latitude, :google_address, :phone, {:program_ids => []})
  end

end
