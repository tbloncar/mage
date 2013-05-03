class Craft < ActiveRecord::Base
	has_many :resources
	belongs_to :classification

	# searchable do
	# 	text :name, :default_boost => 2
	# 	text :short_description
	# end


	def self.home_list
		uncached do
			limit(6)
		end
	end
end