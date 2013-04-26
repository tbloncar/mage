class Resource < ActiveRecord::Base

	belongs_to :crafts

	def self.home_list
		uncached do
			order("upvotes DESC").limit(4)
		end
	end

end