class ResourcesController < ApplicationController
	def search
		@q = params[:q]
		@search = Resource.search() do
			keywords(params[:q])
		end
	end

	def show
		@resource = Resource.find_by_path(params[:resource_path])	
	end
end