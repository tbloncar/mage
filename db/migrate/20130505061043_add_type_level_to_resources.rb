class AddTypeLevelToResources < ActiveRecord::Migration
  def change
    add_column :resources, :level_id, :integer
    add_column :resources, :type_id, :integer
  end
end
