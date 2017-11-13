class PostsController < ApplicationController

before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]

  def index
    @body_class = 'blog'
    @post_all = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.post.create(post_params)
    redirect_to @user
  end

  def show
    @user = current_user
    @post_all = Post.all
    @post = Post.find(params[:id])
  end

  def edit
    @body_class = 'edit_posts'
    @post = Post.find(params[:id])
  end

  def update
    @body_class = 'update_posts'
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to current_user
  end

  def destroy
    @user = current_user
     @post = Post.find(params[:id]).destroy
     redirect_to @user
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
