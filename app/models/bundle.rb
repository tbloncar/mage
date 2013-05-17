class Bundle < ActiveRecord::Base
  attr_accessible :name, :description, :user_id

  belongs_to :user
  has_many :resources, :through => :inclusions
  has_many :inclusions

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true 
end