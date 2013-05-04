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
			sign_in @user
			flash[:success] = "Woohoo! Thanks for creating an account. Feel free to edit your profile or look around elsewhere!"
			redirect_to(user_url(@user.username))
		else
			render 'new'
		end
	end


	def show
		@user = User.find_by_username(params[:user_name])

		upvotes = Upvote.where(user_id: @user.id)
		@resources_upvoted = []
		upvotes.each do |upvote|
			resource = Resource.find_by_id(upvote.resource_id)
			@resources_upvoted << resource
		end
		@crafts_interested = []
		@resources_upvoted.each do |resource|
			craft = resource.craft
			if !@crafts_interested.include?(craft)
				@crafts_interested << craft
			end
		end
	end

	def edit
		@user = User.find_by_username(params[:user_name])
		if @user != current_user
			redirect_to user_url(@user.username)
		end
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