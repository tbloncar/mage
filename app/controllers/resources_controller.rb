class ResourcesController < ApplicationController
	def search
		@q = params[:q]
		@search = Resource.search() do
			keywords(params[:q])
		end
	end

	def show
		@resource = Resource.find_by_path(params[:resource_path])
		@craft = Craft.find_by_id(@resource.craft_id)
		@classification = Classification.find_by_id(@craft.classification_id)
	end

	def new
		@resource = Resource.new
		@crafts = Craft.all
	end

	def create
		@resource = Resource.create(params[:resource])
		@resource.path = @resource.name.downcase.gsub(" ", "-")
		craft_path = Craft.find_by_id(@resource.craft_id).full_path
		@resource.full_path = "#{craft_path}/#{@resource.path}"
		@resource.save

		redirect_to @resource.full_path
	end

	# def create
	# 	user = User.new

	# 	user.username = params[:username]
	# 	user.password = params[:password]
	# 	user.email = params[:email]
	# 	user.bio = params[:bio]
	# 	user.first_name = params[:first]
	# 	user.last_name = params[:last]

	# 	user.save

	# 	redirect_to(user_url(params[:username]) + "?success=yes")
	# end
end