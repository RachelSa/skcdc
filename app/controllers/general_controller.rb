class GeneralController < ApplicationController
    def show
      @recent_posts = Post.all.order('id DESC').limit(5)
    end

    def mission

    end

    def careers

    end
  end
