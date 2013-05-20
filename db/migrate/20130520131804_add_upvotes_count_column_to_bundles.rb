class AddUpvotesCountColumnToBundles < ActiveRecord::Migration
  def change
    add_column :bundles, :upvotes_count, :integer
  end
end
