class CreateBundleTable < ActiveRecord::Migration
  def change
    create_table :bundles do |b|
      b.string :name
      b.text :description
      b.integer :user_id
    end
  end
end
