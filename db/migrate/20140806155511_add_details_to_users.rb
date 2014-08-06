class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :surname, :string
    add_column :users, :date_of_birth, :date
  end
end
