class CraftsController < ApplicationController
	def new
		@craft = Craft.new
	end

	def create
		@craft = Craft.create(params[:craft])
		@craft.path = @craft.name.downcase.gsub(" ", "-")
		@craft.full_path = "/#{@craft.classification.path}/#{@craft.path}"
		@craft.save

		redirect_to craft_url(@craft.classification.path, @craft.path)
	end


	def show
		clpath = params[:classification_path]
		crpath = params[:craft_path]

		@classification = Classification.where(path: clpath).first
		@craft = @classification.crafts.where(path: crpath).first
		@resources = @craft.resources
	end
end