class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |c|
      c.integer :user_id
      c.integer :resource_id
      c.text :content

      c.timestamps
    end
  end
end
