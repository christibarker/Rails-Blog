class UsersController < ApplicationController

before_action :authenticate, only: [:edit, :update, :destroy]  
# validates :email, uniqueness, :true

  def index
    @user_all = User.all
  end

  def new
      @body_class = 'create_account'
      @user = User.new
    # byebug #stop here interact with this line in the terminal
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Account Created'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = 'Account not created'
      redirect_to new_user_path
    end
  end

  def show
    @body_class = 'profile'
    @user_one = current_user
    @user = User.find(params[:id])
    @user_all = User.all.reject{|user| user == @user_one}
  # byebug
  end

  def edit
    @body_class = 'edit_account'
    @user = current_user
    @user = User.find(params[:id])
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end


  def destroy
    @user = current_user
    @user = User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  # opt 2
  # def destroy
  #   # to check its working
  #   # puts "got"
  #   respond_to do |format|
  #     User.find(params[:id]).destroy
  #     session[:user_id] = nil
  #     format.js
  #     format.html {render 'home/index'}
  #   end
  # end

private


  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
