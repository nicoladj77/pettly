class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :city, :string
    add_column :users, :job, :string
    add_column :users, :education, :string
  end
end
