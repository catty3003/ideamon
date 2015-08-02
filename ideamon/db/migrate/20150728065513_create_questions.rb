class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :f1
      t.string :f2
      t.string :f3
      t.string :f4
      t.string :f5
      t.string :f6
      t.string :f7
      t.string :f8
      t.string :f9
      t.string :f10
      t.string :f11
      t.string :f12
      t.string :f13
      t.string :f14
      t.text :f15
      t.string :f16
      t.string :f17
      t.text :f18
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
