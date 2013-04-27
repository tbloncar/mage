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
end