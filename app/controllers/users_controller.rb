class UsersController < ApplicationController

	def view_profile
		@user = User.find_by_username(params[:user_name])
	end

	
end