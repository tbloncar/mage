class RemoveCraftFromClassifications < ActiveRecord::Migration
  def up
  	remove_column :classifications, :craft
  end

  def down
  end
end
