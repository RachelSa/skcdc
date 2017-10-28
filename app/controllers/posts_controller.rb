class PostsController < ApplicationController
before_action :authenticate_user, only: [:new, :edit]
  def show
    @post = Post.find_by(id: params[:id])
    if @post
      @recent_posts = Post.all.order('id DESC').limit(3)
    else
      redirect_to posts_path
    end
  end

  def index
    @posts = Post.all.order('id DESC').limit(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Success! Visit <a href='#{post_path(@post)}'>published post</a>."
      redirect_to admin_path
    else
      @errors = @post.errors.messages
      flash[:notice] = @errors
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Success! Visit <a href='#{post_path(@post)}'>updated post</a>."
      redirect_to admin_path
    else
      @errors = @post.errors.messages
      flash[:notice] = @errors
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted"
    redirect_to admin_path
  end

  def admin
    @posts = Post.all.order('id DESC').limit(20)
  end
  private

  def post_params
    params.require(:post).permit(:title, :content, :upload_attachment)
  end

end
