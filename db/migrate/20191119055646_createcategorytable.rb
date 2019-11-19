class Createcategorytable < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do|t|
      t.string :name
      t.string :alias_name
      t.timestamps
    end
    create_table :articles_categories do|t|
      t.belongs_to :article
      t.belongs_to :category
    end
  end
end
