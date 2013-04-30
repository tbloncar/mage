class CraftsController < ApplicationController

	def show
		clpath = params[:classification_path] #computer-programming
		crpath = params[:craft_path] #scuba-diving

		# check classification first
		@classification = Classification.where(path: clpath).first
		# given the classification, search the crafts under the classification
		@craft = @classification.crafts.where(path: crpath).first
		# given the craft, search the reources under the specific craft
		@resources = @craft.resources		 

		# @craft = Craft.check_classification(clpath, crpath)
		# @resources = Resource.craft_list(@craft.id)
		# @classification = Classification.find_by_id(@craft.classification_id)
	end

end