class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.float :start_money
      t.float :end_money
      t.date :start_at
      t.date :end_at
      t.integer :user_id
      t.timestamps
    end
  end
end
