class ProgramClassroomsController < ApplicationController

  def new

  end

  def create
    byebug
    #@classroom = Classroom.find(params[:id])

    program_classrooms_params
  end

  def index
  end

  def edit
    @programs = Program.all
    @classroom = get_classroom
  end

  def update

  end

private
  def program_classroom_params
    params.require(:program_classroom).permit.({:program_ids => []})
  end

end
