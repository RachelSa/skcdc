class ProgramClassroomsController < ApplicationController

  def new
    @program_classroom = ProgramClassroom.new
    @programs = Program.all
    @classrooms = Classroom.all
  end

  def create
    byebug
  end


end
