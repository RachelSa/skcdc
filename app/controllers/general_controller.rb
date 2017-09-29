class GeneralController < ApplicationController
  before_action :authenticate_user, only: [:admin]
  
    def show
      @recent_posts = Post.all.order('id DESC').limit(5)
    end

    def mission
      @recent_posts = Post.all.order('id DESC').limit(5)
    end

    def careers
      @recent_posts = Post.all.order('id DESC').limit(5)
    end

    def admin

    end


  end
