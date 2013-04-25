class AddUpvotesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :upvotes, :integer
  end
end
