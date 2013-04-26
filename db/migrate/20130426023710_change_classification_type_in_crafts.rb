class ChangeClassificationTypeInCrafts < ActiveRecord::Migration
  def up
  	rename_column :crafts, :classification, :classification_id
  	change_column :crafts, :classification_id, :integer
  end

  def down
  end
end
