class AddFullPathToResources < ActiveRecord::Migration
  def change
  	add_column :resources, :full_path, :string
  end
end
