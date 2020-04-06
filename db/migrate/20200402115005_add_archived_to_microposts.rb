class AddArchivedToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :archived, :boolean, default: false
    add_column :microposts, :title, :string
    add_column :microposts, :status, :string
    add_column :microposts, :visibility, :string

  end
end
