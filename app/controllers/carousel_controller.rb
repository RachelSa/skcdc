class CarouselController < ApplicationController

  def new
    @carousel = Carousel.first

  end

  def create
    @carousel = Carousel.first
    if @carousel.update(carousel_params)
      redirect_to admin_path, :notice => "Success! Visit <a href='/'>homepage</a>."
    else
      @errors = @carousel.errors.messages

      flash[:notice] = @errors
      render :new
    end
  end

  private

  def carousel_params
    params.require(:carousel).permit(:photo_1, :photo_2, :photo_3, :photo_4)
  end
end
