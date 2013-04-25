class CreateResourcesTable < ActiveRecord::Migration
  def up
  	create_table  :resources do |r|
  		r.string  :name
  		r.string  :author
  		r.text    :description
  		r.string  :image_url
  		r.integer :upvotes
  		r.string  :link
  	end
  end

  def down
  end
end
