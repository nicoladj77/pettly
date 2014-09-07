class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.date :date_of_birth
      t.string :breed
      t.integer :user_id
      t.string :weight
      t.string :personality

      t.timestamps
    end
  end
end
