class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :resource_id

  belongs_to :resource
  belongs_to :user
end