class ResourcesController < ApplicationController

	def show
		@resource = Resource.find_by_path(params[:resource_path])	
	end
end