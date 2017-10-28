class ParentResourcesController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]
  def new
    @parent_resource = ParentResource.new
  end

  def create
    @parent_resource = ParentResource.new(parent_resource_params)
    if @parent_resource.save
      flash[:notice] = "Success! Visit <a href='#{parent_resource_path(@parent_resource)}'>published resource</a>."
      redirect_to admin_path
    else
      @errors = @parent_resource.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def index
    @parent_resources = ParentResource.order(:title)
    @recent_posts = Post.all.order('id DESC').limit(3)
  end

  def show
    @parent_resource = ParentResource.find_by(id: params[:id])
    if !@parent_resource
      redirect_to parent_resources_path
    end
  end

  def edit
    @parent_resource = ParentResource.find(params[:id])
  end

  def update
    @parent_resource = ParentResource.find(params[:id])
    if @parent_resource.update(parent_resource_params)
      flash[:notice] = "Success! Visit <a href='#{parent_resource_path(@parent_resource)}'>updated resource</a>."
      redirect_to admin_path
    else
      @errors = @parent_resource.errors.messages
      flash[:notice] = @errors
      render :edit
    end
  end

  def destroy
    @parent_resource = ParentResource.find(params[:id])
    @parent_resource.destroy
    redirect_to admin_path, :notice => "Parent resource deleted"
  end

  def admin
    @parent_resources = ParentResource.all.pluck(:title, :id)
  end

  private

  def parent_resource_params
    params.require(:parent_resource).permit(:title, :description, :outside_url)
  end

end
