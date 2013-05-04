class CreateUpvotesTable < ActiveRecord::Migration
  def change
    create_table :upvotes do |u|
      u.integer :user_id
      u.integer :resource_id
    end
  end
end
