class AddFullPathToCrafts < ActiveRecord::Migration
  def change
  	add_column :crafts, :full_path, :string
  end
end
