class AddImageToCrafts < ActiveRecord::Migration
  def change
    add_attachment :crafts, :image
  end
end
