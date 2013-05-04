class AddUpvotesCountColumnToResources < ActiveRecord::Migration
  def change
    add_column :resources, :upvotes_count, :integer
  end
end
