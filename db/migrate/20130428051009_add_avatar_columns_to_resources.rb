class AddAvatarColumnsToResources < ActiveRecord::Migration
  def change
  	add_attachment :resources, :avatar
  end
end
