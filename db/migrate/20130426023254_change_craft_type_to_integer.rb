class ChangeCraftTypeToInteger < ActiveRecord::Migration
  def up
    connection.execute(%q{
    alter table resources
    alter column craft
    type integer using cast(craft as integer)
  })
  end

  def down
  end
end
