class BenefitsController < ApplicationController

  def new
    @benefit = Benefit.new
  end

  def create
    @benefit = Benefit.new(benefit_params)
    if @benefit.save
      flash[:notice] = "Success! Visit <a href='/careers'>published benefit</a>."
      redirect_to admin_path
    else
      @errors = @benefit.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def edit
    @benefit = Benefit.find(params[:id])
  end

  def update
    @benefit = Benefit.find(params[:id])
    if @benefit.update(benefit_params)
      flash[:notice] = "Success! Visit <a href='/careers'>published benefit</a>."
      redirect_to admin_path
    else
      @errors = @benefit.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def destroy
    @benefit = Benefit.find(params[:id])
    @benefit.destroy
    flash[:notice] = "Benefit deleted"
    redirect_to admin_path
  end

  def admin
    @benefits = Benefit.all.order('id DESC')
  end
  private

  def benefit_params
    params.require(:benefit).permit(:benefit)
  end
end
