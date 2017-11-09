class UsersController < ApplicationController

before_action :authenticate, only: [:edit, :update, :destroy]  

  def index
    @user = User.all
  end

  def new
    @user = User.new
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
    @user = User.find(params[:id])
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
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  
end
