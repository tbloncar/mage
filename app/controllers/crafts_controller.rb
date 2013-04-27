class CraftsController < ApplicationController

	def show
		clpath = params[:classification_path]
		crpath = params[:craft_path]
		@craft = Craft.check_classification(clpath, crpath)
		@resources = Resource.craft_list(@craft.id)
		@classification = Classification.find_by_id(@craft.classification_id)
	end

end