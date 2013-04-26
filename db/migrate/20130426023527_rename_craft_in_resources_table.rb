class RenameCraftInResourcesTable < ActiveRecord::Migration
  def up
  	rename_column :resources, :craft, :craft_id
  end

  def down
  end
end
