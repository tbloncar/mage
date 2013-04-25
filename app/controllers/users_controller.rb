class UsersController < ApplicationController

	def new

	end

	def create
		user = User.new

		user.username = params[:username]
		user.password = params[:password]
		user.email = params[:email]
		user.bio = params[:bio]
		user.first_name = params[:first]
		user.last_name = params[:last]

		user.save

		redirect_to "http://localhost:3000/users/#{params[:username]}/?success=yes"
	end


	def show
		if params[:success] == "yes"
			@message = "Woohoo! Thanks for creating an account. Feel free to edit your profile or look around elsewhere!"
		end
		@user = User.find_by_username(params[:user_name])
	end

	def edit
		@user = User.find_by_username(params[:user_name])
	end

	def update
		user = User.find_by_username(params[:user_name])

		user.email = params[:email]
		user.first_name = params[:first]
		user.last_name = params[:last]
		user.bio = params[:bio]

		user.save

		redirect_to "/users/#{params[:user_name]}"
	end

	def destroy
		user = User.find_by_username(params[:user_name])

		user.destroy

		redirect_to "/"
	end

end