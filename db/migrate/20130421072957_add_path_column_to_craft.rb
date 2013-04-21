class AddPathColumnToCraft < ActiveRecord::Migration
  def change
  	add_column :crafts, :path, :string
  end
end
