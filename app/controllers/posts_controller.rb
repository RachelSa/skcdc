class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @recent_posts = Post.all.order('id DESC').limit(5)
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
      flash[:notice] = "Post published!"
      redirect_to admin_path
    else
      flash[:notice] = "posts must have a title and content"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "post updated!"
      redirect_to admin_path
    else
      flash[:notice] = "posts must have a title and content"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted"
    redirect_to users_path
  end

  def admin
    @posts = Post.all.order('id DESC').limit(20)
  end
  private

  def post_params
    params.require(:post).permit(:title, :content, :upload_attachment)
  end

end
