class Resource < ActiveRecord::Base

	attr_accessible :name, :author, :craft_id, :avatar, :description, :link, :level_id, :type_id
	validates :name, :uniqueness => true
	has_attached_file :avatar, :styles => { :medium => "255x255>", :thumb => "100x100>" }, :default_url => "/assets/eloquent.jpg"
	belongs_to :craft
	belongs_to :user
	belongs_to :level
	belongs_to :type
	has_many :upvotes
	has_many :comments
	has_many :bundles, :through => :inclusions
	has_many :inclusions

	if Rails.env.development?
		searchable do
			text :name, :default_boost => 2
			text :description
			text :author
			text :level
			text :type
		end
	end

	# def self.home_list
	# 	uncached do
	# 		order("upvotes_count DESC").limit(6)
	# 	end
	# end

	scope :home_list, -> { order("upvotes_count DESC").limit(6) }
  scope :craft_list, ->(craft_id) { where('craft_id' => craft_id).order("upvotes DESC").limit(10) }
	# def self.craft_list(craft_id)
	# 	uncached do
			
	# 	end
	# end

end