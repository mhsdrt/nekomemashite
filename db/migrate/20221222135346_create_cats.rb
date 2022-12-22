class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.integer :member_id, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.string :age, null: false
      t.string :cattype, null: false
      t.string :character, null: false
      t.text :profile, null: false
      t.timestamps
    end
  end
end
