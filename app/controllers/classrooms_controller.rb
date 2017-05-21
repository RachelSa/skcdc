class ClassroomsController < ApplicationController

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.create(classroom_params)
    redirect_to :users
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
    @programs = @classroom.programs
  end

  def update
    @classroom = Classroom.find(params[:id])
    @classroom.update(classroom_params)
    redirect_to :new_program_classroom
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to :users
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :location, :map_url, :image_url, :description, :longitude, :latitude, :google_address, :phone, :program)
  end
end
