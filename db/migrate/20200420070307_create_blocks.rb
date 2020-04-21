class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.integer :blocked
      t.integer :blocked_by
      t.text :description  

      t.timestamps
    end
  end
end
