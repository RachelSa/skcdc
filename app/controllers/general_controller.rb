class GeneralController < ApplicationController
  before_action :authenticate_user, only: [:admin]

    def show

      @carousel = Carousel.first
    end

    def mission

    end

    def careers
      @benefits = Benefit.all
      @career_sites = CareerSite.all
    end

    def admin

    end

    def employees
      @employee_resources = EmployeeResource.all
    end


  end
