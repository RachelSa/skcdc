class ParentResourcesController < ApplicationController

  def new
    @parent_resource = ParentResource.new
  end

  def create
    @parent_resource = ParentResource.new(parent_resource_params)
    if @parent_resource.save
      flash[:notice] = "Parent resource published!"
      redirect_to admin_path
    else
      @errors = @parent_resource.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def index
    @parent_resources = ParentResource.all.order('id DESC')
  end

  def show
    @parent_resource = ParentResource.find(params[:id])
  end

  def edit
    @parent_resource = ParentResource.find(params[:id])
  end

  def update
    if ParentResource.update(parent_resource_params)
      flash[:notice] = "Parent resource updated!"
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
