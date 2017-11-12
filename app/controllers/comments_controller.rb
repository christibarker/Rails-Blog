class CommentsController < ApplicationController

before_action :authenticate, only: [:edit, :update, :destroy]

  def index
    # @comment = comment.all
  end

  def new
    # @comment = Comment.new
  end

  def create
    @user = current_user
    @user.comment.create(params[:id])
    redirect_to @post
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(post_params)
    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(:content)
  end

end
