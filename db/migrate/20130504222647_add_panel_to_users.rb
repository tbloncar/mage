class AddPanelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :panel, :boolean, :default => true
  end
end
