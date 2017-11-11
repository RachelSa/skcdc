class CarouselController < ApplicationController

  def new
    @carousel = Carousel.first

  end

  def create
    @carousel = Carousel.first
    byebug
  end

  private

  def carousel_params
    params.require(:carousel).permit(:photo_1, :photo_2, :photo_3, :photo_4)
  end
end
