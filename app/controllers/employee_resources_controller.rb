class EmployeeResourcesController < ApplicationController

  def new
    @employee_resource = EmployeeResource.new
  end

  def create
    @employee_resource = EmployeeResource.new(employee_resource_params)
    if @employee_resource.save
      flash[:notice] = "Success! Visit <a href='/employees'>published employees page</a>."
      redirect_to admin_path
    else
      @errors = @employee_resource.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def edit
    @employee_resource = EmployeeResource.find(params[:id])
  end

  def update
    @employee_resource = EmployeeResource.find(params[:id])
    if @employee_resource.update(employee_resource_params)
      flash[:notice] = "Success! Visit <a href='/employees'>published employees page</a>."
      redirect_to admin_path
    else
      @errors = @employee_resource.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def destroy
    @employee_resource = EmployeeResource.find(params[:id])
    @employee_resource.destroy
    flash[:notice] = "Employee resource deleted"
    redirect_to admin_path
  end

  def admin
    @employee_resources = EmployeeResource.all.order('id DESC')
  end

  private

  def employee_resource_params
    params.require(:employee_resource).permit(:name, :url)
  end

end
