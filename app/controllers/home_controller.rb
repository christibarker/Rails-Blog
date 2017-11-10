class HomeController < ApplicationController
  def index
  	if user_signed_in_?
  	 	#  	opt 1 redirect_to current_user
  	 	@user = current_user 
  	 	render 'users/show'
  	 else
  	 	# redirect_to new_session_path
  	 	render 'home/index'
  	end
	end
end
