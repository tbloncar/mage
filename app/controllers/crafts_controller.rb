class CraftsController < ApplicationController

	def show
		clpath = params[:classification_path]
		crpath = params[:craft_path]
		@craft = Craft.check_classification(clpath, crpath)	
	end

end