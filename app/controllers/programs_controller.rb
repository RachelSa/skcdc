class ProgramsController < ApplicationController
before_action :authenticate_user, only: [:new, :edit]
  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to admin_path, :notice => "#Program created"
    else
      @errors = @program.errors.messages
      flash[:notice] = @errors
      render :new
    end

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
    if @program.update(program_params)
      redirect_to admin_path, :notice => "Program updated"
    else
      @errors = @program.errors.messages
      flash[:notice] = @errors
      render :edit
    end

  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    redirect_to admin_path, :notice => "Program deleted"
  end

  def admin
    @program_names = Program.all.pluck(:title, :id)
  end

  private

  def program_params
    params.require(:program).permit(:title, :description)
  end

end
