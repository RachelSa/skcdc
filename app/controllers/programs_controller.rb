class ProgramsController < ApplicationController

  def new
    @program = Program.new
  end

  def create
    @program = Program.create(program_params)
    redirect_to :users
  end

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    @program.update(program_params)
    redirect_to :users
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    redirect_to :users
  end

  private

  def program_params
    params.require(:program).permit(:title, :description)
  end

end
