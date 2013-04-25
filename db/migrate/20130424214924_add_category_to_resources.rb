class AddCategoryToResources < ActiveRecord::Migration
  def change
  	add_column :resources, :craft, :string
  end
end
