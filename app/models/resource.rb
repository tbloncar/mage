class Resource < ActiveRecord::Base
	attr_accessible :name, :author, :craft_id, :avatar, :description, :link, :level_id, :type_id, :upvotes_count
	
	belongs_to :craft
	belongs_to :user
	belongs_to :level
	belongs_to :type
	has_many :upvotes, :as => :upvotable
	has_many :comments, :as => :commentable
	has_many :bundles, :through => :inclusions
	has_many :inclusions
	has_attached_file :avatar, :path => ":rails_root/public/system/:attachment/:id/:style/:filename", :url => "/system/:attachment/:id/:style/:filename", :styles => { :medium => "255x255>", :thumb => "100x100>" }, :default_url => "/assets/eloquent.jpg"

	validates :name, uniqueness: true
	validates :name, presence: true
	# validates :description, length: { in: 50..150, message: "Between 50 and 150 characters, please. :)" }
	validates :description, presence: true
	validates :author, presence: true
	validates :link, presence: true
	validates :craft_id, presence: true
	validates :level_id, presence: true
	validates :avatar, presence: true

	scope :home_list, -> { order("upvotes_count DESC").limit(6) }
  scope :craft_list, ->(craft_id) { where('craft_id' => craft_id).order("upvotes DESC").limit(10) }

	if Rails.env.development?
		searchable do
			text :name, :default_boost => 2
			text :description
			text :author
			text :level
			text :type
		end
	end
end