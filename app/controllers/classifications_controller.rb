class ClassificationsController < ApplicationController

	def show
		@classification = Classification.find_by_path(params[:classification_path])
	end

end