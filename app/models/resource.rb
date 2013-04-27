class Resource < ActiveRecord::Base

	belongs_to :crafts

	searchable do
		text :name, :default_boost => 2
		text :description
		text :author
	end


	def self.home_list
		uncached do
			order("upvotes DESC").limit(4)
		end
	end

end