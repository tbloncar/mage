class Inclusion < ActiveRecord::Base
  attr_accessible :bundle_id, :resource_id

  belongs_to :bundle
  belongs_to :resource
end