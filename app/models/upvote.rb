class Upvote < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :upvotable, :polymorphic => true
  belongs_to :user
  belongs_to :resource

  scope :votes_for_resources, -> { where(upvotable_type: "Resource") }
  scope :votes_for_bundles, -> { where(upvotable_type: "Bundle") }
end