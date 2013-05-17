class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :resource_id

  belongs_to :resource
  belongs_to :user

  validates :content, presence: true
  validates :user_id, presence: true
  validates :resource_id, presence: true
end