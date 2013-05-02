class ChangeClassificationTypeInCrafts < ActiveRecord::Migration
  def up
  	rename_column :crafts, :classification, :classification_id
    connection.execute(%q{
      alter table crafts
      alter column classification_id
      type integer using cast(classification_id as integer)
    })
  end

  def down
  end
end
