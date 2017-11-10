class PostsController < ApplicationController

before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to @user
  end

  def show
    @post_all = Post.all
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
     @post = Post.find(params[:id]).destroy
     redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
