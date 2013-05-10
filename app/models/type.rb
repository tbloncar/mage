class Type < ActiveRecord::Base
  has_many :resources
  
  # searchable do
  #   text :name, :default_boost => 2
  # end
end