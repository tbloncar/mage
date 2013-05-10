class Craft < ActiveRecord::Base
	has_many :resources
	belongs_to :classification

	scope :top6,
		joins(:resources).
		group("crafts.id").
		select("crafts.id, crafts.name, crafts.image_url, crafts.short_description, crafts.full_path, sum(resources.upvotes_count) AS order_by").
		order("order_by DESC")

	# searchable do
	# 	text :name, :default_boost => 2
	# 	text :short_description
	# end

end