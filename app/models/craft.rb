class Craft < ActiveRecord::Base
	attr_accessible :image, :name, :classification_id, :short_description, :long_description

	has_many :resources
	belongs_to :classification

	has_attached_file :image, :styles => { :medium => "255x255>", :thumb => "100x100>" }, :default_url => "/assets/eloquent.jpg"

	scope :top6,
		joins(:resources).
		group("crafts.id").
		select("crafts.id, crafts.name, crafts.short_description, crafts.image_file_name, crafts.image_updated_at, crafts.full_path, sum(resources.upvotes_count) AS order_by").
		order("order_by DESC").
		limit(6)

	if ENV["RAILS_ENV"] = "development"
		searchable do
			text :name, :default_boost => 2
			text :short_description
		end
	end

end