class RenameSurnameColumnInUser < ActiveRecord::Migration
  def change
    rename_column :users, :surname, :last_name
  end
end
