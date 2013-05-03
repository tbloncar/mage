class RemoveUpvotesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :upvotes
  end
end
