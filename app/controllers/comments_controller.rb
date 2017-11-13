class CommentsController < ApplicationController

before_action :authenticate, only: [:edit, :update, :destroy]

  def index
    @comment_all = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    # binding.pry
    current_user.comments.create(comment_params)
    # redirect_to @post
  end

  def show
    # @post_all = Post.all
    # @comment_all = Comment.all
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to posts_path
  end

private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
