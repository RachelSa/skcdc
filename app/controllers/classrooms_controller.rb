class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
    @map_url = "https://maps.googleapis.com/maps/api/staticmap?center=#{@classroom.latitude},#{@classroom.longitude}&zoom=15&size=400x400&markers=color:red%7C#{@classroom.google_address}&key=#{ENV["google_key"]}"
  end
end
