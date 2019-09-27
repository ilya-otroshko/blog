class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :count
      t.integer :liketable_id
      t.string :liketable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
