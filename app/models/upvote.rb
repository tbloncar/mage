class Upvote < ActiveRecord::Base
  attr_accessible :user_id, :resource_id

  belongs_to :user
  belongs_to :resource
  
end