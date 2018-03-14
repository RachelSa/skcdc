class CareerSitesController < ApplicationController

  def new
    @career_site = CareerSite.new
  end

  def create
    @career_site = CareerSite.new(career_site_params)
    if @career_site.save
      flash[:notice] = "Success! Visit <a href='/careers'>published career site</a>."
      redirect_to admin_path
    else
      @errors = @career_site.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def edit
    @career_site = CareerSite.find(params[:id])
  end

  def update
    @career_site = CareerSite.find(params[:id])
    if @career_site.update(career_site_params)
      flash[:notice] = "Success! Visit <a href='/careers'>published career site</a>."
      redirect_to admin_path
    else
      @errors = @career_site.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def destroy
    @career_site = CareerSite.find(params[:id])
    @career_site.destroy
    flash[:notice] = "Career site deleted"
    redirect_to admin_path
  end

  def admin
    @career_sites = CareerSite.all.order('id DESC')
  end

  private

  def career_site_params
    params.require(:career_site).permit(:name, :url)
  end

end
