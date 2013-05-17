class ClassificationsController < ApplicationController
	def show
		@classification = Classification.find_by_path(params[:classification_path])
		@crafts = @classification.crafts
		@resources = []
		@crafts.each do |craft|
			craft.resources.each do |craft_resource|
				@resources.push(craft_resource)
			end
		end
		@resources
	end
end