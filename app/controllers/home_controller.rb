class HomeController < ApplicationController
	def home
		@resources = Resource.home_list
		@users = User.home_list
	end
end 