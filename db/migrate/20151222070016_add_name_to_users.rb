class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :Organization_name, :string
    add_column :users, :Organization_ID, :string
	add_column :users, :Individual_ID, :string
	add_column :users, :level, :integer
	add_column :users, :designation, :string
	add_column :users, :role, :integer
  end
end
