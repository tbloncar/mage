class AddPathColumnToBundlesTable < ActiveRecord::Migration
  def change
    add_column :bundles, :path, :string
  end
end
