class Resource < ActiveRecord::Base

	def self.home_list
		uncached do
			order("upvotes DESC").limit(4)
		end
	end

end