class ResourcesController < ApplicationController

	def show

		clpath = params[:classification_path]
		crpath = params[:craft_path]
		rpath  = params[:resource_path]


		# check classification first
		@classification = Classification.where(path: clpath).first
		# given the classification, search the crafts under the classification
		@craft = @classification.crafts.where(path: crpath).first
		# given the craft, search the reources under the specific craft
		@resource = @craft.resources.where(path: rpath).first
		upvotes = @resource.upvotes
		@users = []
		upvotes.each do |upvote|
			@users << User.find_by_id(upvote.user_id)
		end
		if @resource.user
			@contributor = @resource.user
		end

		if signed_in?
			@recommended = Upvote.where("user_id = ? AND resource_id = ?", current_user.id, @resource.id)
		else
			@recommended = []
		end
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
		@resource.user_id = current_user.id
		@resource.upvotes_count = 1
		if !@resource.avatar_file_name
			kit = IMGKit.new(@resource.link)
			img = kit.to_img(:png)
			file  = Tempfile.new(["template_#{@resource.id}", 'png'], 'tmp',
                         :encoding => 'ascii-8bit')
			file.write(img)
			file.flush
			@resource.avatar = open(file)
		end

		@resource.save

		# Upvote.create({user_id: current_user, resource_id: @resource.id})
		upvote = Upvote.new
		upvote.user_id = current_user.id
		upvote.resource_id = @resource.id
		upvote.save

		redirect_to @resource.full_path

	end

	def update
		resource = Resource.find_by_path(params[:resource_path])
		resource.upvotes_count += 1
		resource.save

		upvote = Upvote.new
		upvote.user_id = current_user.id
		upvote.resource_id = resource.id
		upvote.save

		redirect_to resource.full_path
	end

	def edit
		@resource = Resource.find_by_id(params[:id])
	end

end