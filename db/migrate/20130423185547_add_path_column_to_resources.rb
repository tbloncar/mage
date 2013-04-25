class AddPathColumnToResources < ActiveRecord::Migration
  def change
  	add_column :resources, :path, :string
  end
end
