class CreateCraftsTable < ActiveRecord::Migration
  def up
  	create_table :crafts do |c|
  		c.string :name
  		c.text :short_description
  		c.text :long_description
  		c.string :image_url
  	end
  end

  def down
  end
end
