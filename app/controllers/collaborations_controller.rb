class CollaborationsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    if @collaboration.save
      redirect_to :users, :notice => "#{@collaboration.title} created"
    else
      flash[:notice] = "collaborations must have a title and description"
      render :new
    end
  end

  def show
    @collaboration = Collaboration.find(params[:id])
  end

  def index
    @collaborations = Collaboration.all
  end

  def edit
    @collaboration = Collaboration.find(params[:id])
  end

  def update
    @collaboration = Collaboration.find(params[:id])
    if @collaboration.update(collaboration_params)
      redirect_to :users, :notice => "#{@collaboration.title} updated"
    else
      flash[:notice] = "collaborations must have a title and description"
      render :edit
    end
  end

  def destroy
    Collaboration.find(params[:id]).destroy
    flash[:notice] = "collaboration deleted"
    redirect_to :users
  end

  private
  def collaboration_params
    params.require(:collaboration).permit(:title, :description)
  end
end
