class AddIndexToUsersUsername < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :string
    add_column :users, :city, :string

  end
end
