class CreateUsers < ActiveRecord::Migration
  def up
  	create_table :users do |u|
  		u.string :username
  		u.string :password
  		u.string :email
  		u.string :first_name
  		u.string :last_name
  		u.text :bio
  	end
  end

  def down
  end
end
