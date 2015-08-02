class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :deadline
      t.boolean :done
      t.string :question
      t.text :comment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
