class ChangeCraftTypeToInteger < ActiveRecord::Migration
  def up
  	change_column :resources, :craft, :integer, :default => 0, :null => false
  end

  def down
  end
end