class UsersController < ApplicationController

before_action :authenticate, only: [:edit, :update, :destroy]  

  def index
    @user_all = User.all
  end

  def new
    @user = User.new
    # byebug #stop here interact with this line in the terminal
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Account Created'
      redirect_to @user
    else
      flash[:alert] = 'Account not created'
      redirect_to new_user_path
    end
  end

  def show
    @user_one = current_user
    @user = User.find(params[:id])
    @user_all = User.all.reject{|user| user == @user_one}
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id]).destroy
  end
private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
