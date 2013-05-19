class Upvote < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :upvotable, :polymorphic => true
  belongs_to :user
  belongs_to :resource
  
end