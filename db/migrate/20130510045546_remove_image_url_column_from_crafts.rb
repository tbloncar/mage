class RemoveImageUrlColumnFromCrafts < ActiveRecord::Migration
  def change
    remove_column :crafts, :image_url
  end
end
