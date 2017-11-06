class CarouselController < ApplicationController

  def edit
    @carousel = Carousel.first
  end
end
