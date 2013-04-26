class ChangeCraftTypeToInteger < ActiveRecord::Migration
  def up
  	change_column :resources, :craft, :integer
  end

  def down
  end
end
