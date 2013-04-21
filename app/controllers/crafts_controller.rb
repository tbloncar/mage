class CraftsController < ApplicationController

	def show
		@craft = Craft.find_by_path(params[:craft_path])
	end

end