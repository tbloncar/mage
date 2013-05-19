class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :commentable_id

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  belongs_to :resource

  validates :content, presence: true
  validates :user_id, presence: true
end