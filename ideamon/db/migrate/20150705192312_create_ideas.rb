class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :post
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
