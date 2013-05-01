class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		# user.username = params[:username]
		# user.password = params[:password]
		# user.password_confirmation = params[:password_confirmation]
		# user.email = params[:email]
		# user.bio = params[:bio]
		
		if @user.save
			flash[:success] = "Woohoo! Thanks for creating an account. Feel free to edit your profile or look around elsewhere!"
			redirect_to(user_url(@user.username))
		else
			render 'new'
		end
	end


	def show
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

		redirect_to edit_user_url(params[:user_name])
	end

	def destroy
		user = User.find_by_username(params[:user_name])

		user.destroy

		redirect_to home_url
	end

end