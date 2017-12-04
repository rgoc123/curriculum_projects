class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.boolean :complete, default: false, null: false
      t.boolean :private, default: false, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :goals, :user_id
    add_index :goals, :title, unique: true
  end
end
