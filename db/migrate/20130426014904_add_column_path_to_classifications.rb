class AddColumnPathToClassifications < ActiveRecord::Migration
  def change
  	add_column :classifications, :path, :string
  end
end
