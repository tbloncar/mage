class Upvote < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :upvotable, :polymorphic => true
  belongs_to :user
  belongs_to :resource

  scope :vote_for_resources, where(upvotable_type: "Resource")
end