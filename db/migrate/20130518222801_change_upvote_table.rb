class ChangeUpvoteTable < ActiveRecord::Migration
  def change
    remove_column :upvotes, :resource_id
    add_column :upvotes, :upvotable_id, :integer
    add_column :upvotes, :upvotable_type, :string
  end
end
