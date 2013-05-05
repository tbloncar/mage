class CreateTypeTable < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.string :icon_url
    end
    add_column :levels, :icon_url, :string
  end
end
