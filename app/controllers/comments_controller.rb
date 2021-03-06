class CommentsController < ApplicationController

before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]

  def index
    @comment_all = Comment.all
  end

  def new
    @comment = Comment.new
  end


 def create
    respond_to do |format|
      @comment = current_user.comments.create(comment_params)
      format.js
      format.html {redirect_to posts_path}
      end 
  end

  # def create
  #   # binding.pry
  #   current_user.comments.create(comment_params)
  #   redirect_to posts_path
  # end

  def show
    # @post_all = Post.all
    # @comment_all = Comment.all
    @comment = Comment.find(params[:id])
  end

  def edit
    @body_class = 'show'
    @comment = Comment.find(params[:id])
    # redirect_to @post
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to posts_path
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to posts_path
  end

private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
