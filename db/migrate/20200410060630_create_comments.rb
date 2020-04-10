class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :micropost_id
      t.integer :user_id
      t.datetime "created_at", null: false


    end
  end
end
