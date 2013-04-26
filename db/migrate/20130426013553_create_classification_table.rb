class CreateClassificationTable < ActiveRecord::Migration
  def up
  	create_table :classifications do |c|
  		c.string :name
  		c.text :short_description
  		c.text :long_description
  		c.string :image_url
  		c.string :craft
  	end
  end

  def down
  end
end
