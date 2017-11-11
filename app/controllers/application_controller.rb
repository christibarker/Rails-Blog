class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

helper_method :current_user, :user_signed_in_?, :authenticate

  def authenticate
  	if !session[:user_id]
  	redirect_to new_session_path
  	end
  end

  def current_user
  	if user_signed_in_?
  		User.find(session[:user_id])
  	end
  end

  def user_signed_in_?
  	!session[:user_id].nil?
  end

end
