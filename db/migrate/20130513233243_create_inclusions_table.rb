class CreateInclusionsTable < ActiveRecord::Migration
  def change
    create_table :inclusions do |i|
      i.integer :bundle_id
      i.integer :resource_id
      i.text :description
    end
  end
end
