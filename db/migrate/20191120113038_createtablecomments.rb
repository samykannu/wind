class Createtablecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do|t|
      t.string :title
      t.text :content
      t.references :commentable, polymorphic: true
      t.timestamps
    end
    create_table :events do|t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
