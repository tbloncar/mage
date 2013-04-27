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

	def self.craft_list(craft_id)
		uncached do
			where('craft_id' => craft_id).order("upvotes DESC").limit(10)
		end
	end

end