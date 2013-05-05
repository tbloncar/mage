class CreateLevelTable < ActiveRecord::Migration
  def change
    create_table :levels do |l|
      l.string :name
    end
  end
end
