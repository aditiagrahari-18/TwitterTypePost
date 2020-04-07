class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.boolean :liked
      t.boolean :disliked
      t.integer :post_id
      t.integer :int

      t.timestamps
    end
  end
end
