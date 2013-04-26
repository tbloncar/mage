class AddClassificationColumnToCrafts < ActiveRecord::Migration
  def change
  	add_column :crafts, :classification, :string
  end
end
