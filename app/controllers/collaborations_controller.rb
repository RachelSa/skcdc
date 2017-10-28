class CollaborationsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    if @collaboration.save
      redirect_to admin_path, :notice => "Success! Visit <a href='#{collaboration_path(@collaboration)}'>published collaboration</a>."
    else
      @errors = @collaboration.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def show
    @collaboration = Collaboration.find_by(id: params[:id])
    if !@collaboration
      redirect_to collaborations_path
    end
  end

  def index
    @collaborations = Collaboration.all.order(title: :desc)
    @recent_posts = Post.all.order('id DESC').limit(3)
  end

  def edit
    @collaboration = Collaboration.find(params[:id])
  end

  def update
    @collaboration = Collaboration.find(params[:id])
    if @collaboration.update(collaboration_params)
      redirect_to admin_path, :notice => "Success! Visit <a href='#{collaboration_path(@collaboration)}'>updated collaboration</a>."
    else
      @errors = @collaboration.errors.messages
      flash[:notice] = @errors
      render :edit
    end
  end

  def destroy
    Collaboration.find(params[:id]).destroy
    flash[:notice] = "collaboration deleted"
    redirect_to admin_path
  end

  def admin
    @collaboration_titles = Collaboration.all.pluck(:title, :id)
  end

  private
  def collaboration_params
    params.require(:collaboration).permit(:title, :description)
  end
end
