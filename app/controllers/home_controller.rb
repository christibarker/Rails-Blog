class HomeController < ApplicationController
  def index
    @body_class = 'home'
  	if user_signed_in_?
  	 	#  	opt 1 redirect_to current_user
  	 	@user = current_user 
  	 	redirect_to @user
    end
  	#  else
  	#  	# redirect_to new_session_path
  	#  	redirect_to root_path
  	# end
	end
end
