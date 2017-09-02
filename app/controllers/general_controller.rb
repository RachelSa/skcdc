class GeneralController < ApplicationController
    def show
      @recent_posts = Post.all.order('id DESC').limit(5)
    end

    def mission
      @recent_posts = Post.all.order('id DESC').limit(5)
    end

    def careers
      @recent_posts = Post.all.order('id DESC').limit(5)
    end
  end
