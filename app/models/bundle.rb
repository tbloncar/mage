class Bundle < ActiveRecord::Base
  attr_accessible :name, :description, :user_id
end