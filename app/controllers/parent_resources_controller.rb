class ParentResourcesController < ApplicationController

  def new
    @parent_resource = ParentResource.new
  end

  def create
    @parent_resource = ParentResource.new(parent_resource_params)
    if @parent_resource.save
      flash[:notice] = "Parent resource published!"
      redirect_to :users
    else
      flash[:notice] = "parent_resources must have a title and description"
      render 'new'
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
      redirect_to :users
    else
      flash[:notice] = "parent resources must have a title and description"
      render 'new'
    end
  end

  def destroy
    @parent_resource = ParentResource.find(params[:id])
    @parent_resource.destroy
    redirect_to :users, :notice => "Parent resource deleted"
  end

  private

  def parent_resource_params
    params.require(:parent_resource).permit(:title, :description, :outside_url)
  end

end
